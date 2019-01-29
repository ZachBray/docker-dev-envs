FROM ubuntu:18.04

# XWINDOWS
# ========

RUN apt update && \
    apt install -y \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
        libcanberra-gtk-module \
	libcups2 \
	libdatrie1 \
	libdbus-1-3 \
	libfontconfig1 \
	libfreetype6 \
	libgconf-2-4 \
	libgcrypt20 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgpg-error0 \
	libgraphite2-3 \
	libnotify-bin \
	libnss3 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libxcomposite1 \
	libxcursor1 \
	libxdmcp6 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	liblzma5 \
	libxkbfile1 \
	sudo \
	gnupg \
	wget \
	ttf-bitstream-vera \
	pulseaudio \
	lxappearance \
	locales \
	curl

# install git
RUN apt update && \
    apt install -y git

# configure locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# add user
RUN apt update && \
    apt install -y sudo
RUN useradd dev && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir -p /home/dev
RUN chown -R dev:dev /home/dev
USER dev
ENV HOME /home/dev
WORKDIR /home/dev


# RUST
# ====

# install GCC
RUN sudo apt update && \
    sudo apt install -y gcc

# install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# configure cargo variables
ENV CARGO_HOME $HOME/.cargo
ENV PATH $CARGO_HOME/bin:$PATH

# configure rust source path for completion
RUN rustup component add rust-src
ENV RUST_SRC_PATH $HOME/.rustup/toolchains/$RUST_VERSION-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src


# DOTNET
# ======

RUN sudo apt update && \
    sudo apt install -y apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-bionic-prod bionic main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN sudo apt update && \
    sudo apt install -y dotnet-sdk-2.2

# MONO + FSHARP
# =============

RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN sudo apt install -y apt-transport-https
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
RUN sudo apt update && \
    sudo apt install -y libsecret-1-0 \
                        gnome-keyring \
                        unzip \
                        mono-complete \
                        msbuild \
                        fsharp


# WEB
# ===

# install node
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -  && \
    sudo apt update && \
    sudo apt install -y nodejs

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt update && \
    sudo apt install -y yarn

# install typescript and tslint globally
RUN sudo yarn global add typescript \
                         tslint


# JAVA
# ====

# install JDK
# RUN sudo apt update && \
#     sudo apt install -y openjdk-8-jdk

# change shell so we can source sdkman in future steps
SHELL ["/bin/bash", "-c"]

# install SDKMAN, Maven and Kotlin
RUN sudo apt update && \
    sudo apt install -y zip unzip curl
RUN curl -s "https://get.sdkman.io" | bash
ENV BASH_ENV /home/dev/.sdkman/bin/sdkman-init.sh
RUN sdk install java 8.0.202-amzn
RUN sdk install java 11.0.2-open
RUN sdk install maven
RUN sdk install kotlin
RUN sdk install kscript


# SHELL
# =====

# install ZSH
RUN sudo apt update && \
    sudo apt install -y zsh \
                        powerline \
                        fonts-powerline \
                        zsh-theme-powerlevel9k \
                        zsh-syntax-highlighting
RUN sudo usermod -s /usr/bin/zsh dev
RUN mv /home/dev/.zshrc /home/dev/.zshrc.old
ADD .zshrc /home/dev/.zshrc
RUN sudo chown dev:dev ~/.zshrc
RUN cat /home/dev/.zshrc.old >> /home/dev/.zshrc
RUN rm /home/dev/.zshrc.old

# install tmux
RUN sudo apt update && \
    sudo apt install -y tmux
ADD .tmux.conf /home/dev/.tmux.conf
RUN sudo chown dev:dev ~/.tmux.conf

# install vim
RUN sudo apt update && \
    sudo apt install -y vim


# TOOLS
# =====

RUN sudo apt update && sudo apt install -y graphviz
RUN sudo apt update && sudo apt install -y tree
RUN sudo apt update && sudo apt install -y net-tools
RUN sudo apt update && sudo apt install -y lsof
RUN sudo apt update && sudo apt install -y strace
RUN sudo apt update && sudo apt install -y linux-tools-`uname -r` linux-tools-generic

# ENTRYPOINT
# ==========

ENTRYPOINT tmux

