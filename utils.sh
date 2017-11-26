#!/bin/bash

function config_volume() {
  local VOLUME_DIR="$HOME/.docker_vim/$1";
  if [ ! -d "$VOLUME_DIR" ] || [ ! -f "$VOLUME_DIR" ];
  then
    mkdir -p $VOLUME_DIR
  fi
  local VOLUME_ARG="-v $VOLUME_DIR:/home/dev/$1";
  echo "$VOLUME_ARG";
}

function docker_vim() {
  echo "
Docker VIM
";
  if  [ $# -eq 0 ];
  then
    echo "
Usage:
  docker_vim <environment> <exposed_port>...

Options:
  environment      One of base, js, ts, rust, rust-nightly, eclim, mono, or pony
";
  else
    local EXPOSED_PORTS="";
    local ENTRYPOINT="";
    for port in ${@:2};
    do
      local EXPOSED_PORTS="$EXPOSED_PORTS --expose $port -p $port:$port";
      local ENTRYPOINT="--entrypoint /bin/bash";
    done
    local DOCKER_COMMAND="docker run -it --rm \
      $EXPOSED_PORTS \
      $ENTRYPOINT \
      -v $(pwd):/home/dev/src \
      $(config_volume .ssh) \
      $(config_volume .gitconfig) \
      $(config_volume .gradle) \
      $(config_volume .m2) \
      $(config_volume .cargo/registry) \
      $(config_volume .cache) \
      $(config_volume .yarn) \
      env/vim/$1
    ";
    echo "Executing:";
    echo $DOCKER_COMMAND;
    eval $DOCKER_COMMAND;
  fi
}
