#!/bin/bash

function start_vim() {
  if [ $# -eq 0 ]
  then
    echo ""
    echo "Must supply at least one configuration argument and optionally ports to expose."
    echo ""
    echo "Format:"
    echo "    start_vim <CONFIG> [<PORT_A> <PORT_B> ...]"
    echo ""
    echo "Where:"
    echo "    CONFIG is a vim container configuration: base, js, ts, ts-rc, mono, rust, rust-nightly, eclim, pony or ocaml."
    echo ""
    echo "For example:"
    echo "    start_vim ts 3000 8080"
    echo ""
  else
    echo Starting docker for language $1
    EXPOSE_ARGS=""
    ENTRYPOINT_ARGS=""
    for i in ${@:2}
    do
        EXPOSE_ARGS="$EXPOSE_ARGS --expose $i -p $i:$i"
        ENTRYPOINT_ARGS="--entrypoint /bin/bash"
        echo Exposing port $i
    done
    docker run -it -v $(pwd):/home/dev/src \
                   -v ~/.ssh:/home/dev/.ssh \
                   -v ~/.gitconfig:/home/dev/.gitconfig \
                   -v ~/.gradle:/home/dev/.gradle \
                   -v ~/.cargo:/home/dev/.cargo \
                   -v ~/.m2:/home/dev/.m2 \
                   $EXPOSE_ARGS \
                   $ENTRYPOINT_ARGS \
                   env/vim/$1
  fi
}
