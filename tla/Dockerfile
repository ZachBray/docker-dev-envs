FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
      default-jre \
      wget \
      unzip \
      texlive-latex-base

RUN wget -q -O tla.zip \
    https://github.com/tlaplus/tlaplus/releases/download/v1.5.4/TLAToolbox-1.5.4-linux.gtk.x86_64.zip && \
    unzip tla.zip && \
    rm tla.zip

VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /toolbox/toolbox
