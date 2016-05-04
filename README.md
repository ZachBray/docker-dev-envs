# Docker development environments

This repository contains `Dockerfile`s that construct development environments with Vim configured.

## Prerequisites

- Docker

## Installation

Run the following commands:

```
git clone https://github.com/ZachBray/docker-dev-envs ~/.devenvs
cd ~/.devenvs
./build.sh
echo source alias.sh >> ~/.bashrc
```

## Usage

Run one of the following commands to run Vim with access to the current directory.

### No language specialization

Run `vim.base`


### JavaScript/Babel/ES6

Run `vim.js`


### TypeScript

Run `vim.ts`


### Mono

Run `vim.mono`


### Advanced

If you need access to a bash shell in the container, e.g., to install/run a project under the runtime, run the following command replacing `js` as appropriate:

```
docker run -it -v $(pwd):/home/dev/src env/vim/js
```
