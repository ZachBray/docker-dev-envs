#!/bin/bash

function config_volume() {
  HOST_ROOT=$2
  if [[ -z "$HOST_ROOT" ]]
  then
    HOST_ROOT=$HOME/.docker_dev_env
  fi
  local VOLUME_DIR="$HOST_ROOT/$1";
  if [ ! -d "$VOLUME_DIR" ] || [ ! -f "$VOLUME_DIR" ];
  then
    mkdir -p $VOLUME_DIR
  fi
  local VOLUME_ARG="-v $VOLUME_DIR:/home/dev/$1";
  echo "$VOLUME_ARG";
}

function dev_env() {
  echo "
Docker VIM
";
  if  [ $# -eq 0 ];
  then
    echo "
Usage:
  dev_env <environment> <exposed_port>...

Options:
  environment      One of base, js, ts, rust, rust-nightly, eclim, mono, or pony
";
  else
    local IMAGE=$1
    local EXPOSED_PORTS="";
    local ENTRYPOINT="";
    local EXTRA_ARGS="-it"; # Default to running in the foreground
    if [[ $IMAGE == *"tla"* ]]
    then
      local EXTRA_ARGS="-d"; # Make it an interactive session for vim
    fi
    for port in ${@:2};
    do
      local EXPOSED_PORTS="$EXPOSED_PORTS --expose $port -p $port:$port";
      local ENTRYPOINT="--entrypoint /bin/bash";
    done
    local DOCKER_COMMAND="docker run --rm \
      $EXTRA_ARGS \
      $EXPOSED_PORTS \
      $ENTRYPOINT \
      -v $(pwd):/home/dev/src \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -e DISPLAY=$DISPLAY \
      --cap-add=sys_admin \
      --security-opt seccomp=unconfined \
      --shm-size 2G \
      $(config_volume .ssh $HOME) \
      $(config_volume .gitconfig $HOME) \
      $(config_volume .gradle) \
      $(config_volume .m2) \
      $(config_volume .java) \
      $(config_volume .cargo/registry) \
      $(config_volume .cache) \
      $(config_volume .yarn) \
      $(config_volume .IdeaIC2018.3) \
      $(config_volume .Rider2018.3) \
      $(config_volume .WebStorm2018.3) \
      $(config_volume .vscode/extensions/ms-vscode.csharp-1.13.1/.omnisharp) \
      $(config_volume .vscode/extensions/ms-vscode.csharp-1.13.1/.debugger) \
      env/$IMAGE
    ";
    echo "Executing:";
    xhost +
    echo $DOCKER_COMMAND;
    eval $DOCKER_COMMAND;
  fi
}

