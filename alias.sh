#!/bin/bash

function start_vim() {
  if  [ $# -eq 1 ]
  then
    echo Starting vim for configuration $1
    docker run -it -v $(pwd):/home/dev/src \
                   -v ~/.ssh:/home/dev/.ssh \
                   -v ~/.gitconfig:/home/dev/.gitconfig \
                   -v ~/.gradle:/home/dev/.gradle \
                   -v ~/.cargo:/home/dev/.cargo \
                   -v ~/.m2:/home/dev/.m2 \
                   env/vim/$1
  else
    echo Must supply one and only one configuration argument: base, js, ts, ts-rc, mono, rust, rust-nightly, eclim, pony or ocaml
  fi
}

function start_container() {
  EXPOSE_ARG=""
  if [ $# -eq 0 ]
  then
    echo Must supply at least one configuration argument, eg., start_container js
  else
    echo Starting docker for language $1 and exposing port $2
    docker run -it -v $(pwd):/home/dev/src \
                   -v ~/.ssh:/home/dev/.ssh \
                   -v ~/.gitconfig:/home/dev/.gitconfig \
                   -v ~/.gradle:/home/dev/.gradle \
                   -v ~/.cargo:/home/dev/.cargo \
                   -v ~/.m2:/home/dev/.m2 \
                   --expose $2 -p $2:$2 \
                   --entrypoint /bin/bash \
                   env/vim/$1
  fi
}
