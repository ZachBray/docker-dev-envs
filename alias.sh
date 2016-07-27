#!/bin/bash
shopt -s expand_aliases

DOCKER_PREFIX='docker run -it -v $(pwd):/home/dev/src -v ~/.ssh:/home/dev/.ssh -v ~/.gitconfig:/home/dev/.gitconfig'
alias vim.base="$DOCKER_PREFIX env/vim/base"
alias vim.js="$DOCKER_PREFIX env/vim/js"
alias vim.ts="$DOCKER_PREFIX env/vim/ts"
alias vim.mono="$DOCKER_PREFIX env/vim/mono"
alias vim.rust="$DOCKER_PREFIX env/vim/rust"
alias vim.rust-nightly="$DOCKER_PREFIX env/vim/rust-nightly"
alias vim.eclim="$DOCKER_PREFIX env/vim/eclim"
alias vim.pony="$DOCKER_PREFIX env/vim/pony"
alias vim.ocaml="$DOCKER_PREFIX env/vim/ocaml"
