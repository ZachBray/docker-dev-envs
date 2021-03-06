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
echo source ~/.devenvs/utils.sh >> ~/.bashrc
```

## Usage

Run one of the following commands to run Vim with access to the current directory.

### No language specialization

Run `start_vim base`


### JavaScript/Babel/ES6

Run `start_vim js`


### TypeScript

Run `start_vim ts`


### Mono (C# / F#)

Run `start_vim mono`


### Rust

Run `start_vim rust`

Make sure that the current user owns the `~/.cargo` directory.

### Java/Scala (and other Eclim/Eclipse languages)

Run `start_vim eclim`

Please note that you must create an eclipse project before the plugin works.

#### Maven

```
:! mvn eclipse:eclipse
:MvnRepo
:ProjectImport .
```

#### Gradle

In `build.gradle` make sure you have:
```
apply plugin: 'eclipse'
```

Then run:
```
:! ./gradlew eclipse
:ProjectImport .
```

Make sure that the current user owns the `~/.gradle` directory.

### Pony

Run `start_vim pony`

### OCaml

Run `start_vim ocaml`

### Advanced

If you need access to a bash shell in the container, e.g., to install/run a project under the runtime, run the following command replacing `js` as appropriate:

```
docker run -it -v $(pwd):/home/dev/src --entrypoint /bin/bash env/vim/js
```

## Docker Hints

### Remove stopped containers and dangling images

```
docker rm $(docker ps -aq)
docker rmi $(docker images --filter dangling=true --quiet)
```
