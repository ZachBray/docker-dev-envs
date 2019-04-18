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
    sudo apt install -y apt-transport-https \
                        software-properties-common 

RUN sudo apt update && \
    sudo apt install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu60 \
        liblttng-ust0 \
        libssl1.0.0 \
        libstdc++6 \
        zlib1g
ENV DOTNET_SDK_VERSION 2.2.104
RUN curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz \
    && dotnet_sha512='fd03cc4abea849ee5e05a035e2888c71d8842e64389dd94d7301e0fcfc189cbed99fe84a6174b657ffe3d328faa761972c061a339246f63c9ba8fa31ead2a1b0' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && sudo mkdir -p /usr/share/dotnet \
    && sudo tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV DOTNET_USE_POLLING_FILE_WATCHER=true

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

# use repository that holds JDK 11
RUN sudo add-apt-repository ppa:openjdk-r/ppa

# install JDK
RUN sudo apt update && \
    sudo apt install -y openjdk-8-jdk \
                        openjdk-8-dbg \
                        openjdk-11-jdk \
                        openjdk-11-dbg

# change shell so we can source sdkman in future steps
SHELL ["/bin/bash", "-c"]

# install SDKMAN, Maven and Kotlin
RUN sudo apt update && \
    sudo apt install -y zip unzip curl
RUN curl -s "https://get.sdkman.io" | bash
ENV BASH_ENV /home/dev/.sdkman/bin/sdkman-init.sh
RUN sdk install maven
RUN sdk install gradle
RUN sdk install kotlin
RUN sdk install kscript

# install async-profiler
RUN wget https://github.com/jvm-profiling-tools/async-profiler/releases/download/v1.5/async-profiler-1.5-linux-x64.tar.gz -O /tmp/async-profiler.tar.gz
RUN sudo mkdir -p /tools
RUN sudo chown dev /tools
RUN tar -xvzf /tmp/async-profiler.tar.gz -C /tools
RUN rm /tmp/async-profiler.tar.gz

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

# WIRESHARK
# =========
RUN sudo apt update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wireshark
RUN sudo groupadd wireshark
RUN sudo usermod -a -G wireshark dev
RUN sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure wireshark-common
RUN sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
RUN sudo chmod +x /usr/bin/dumpcap

# TOOLS
# =====

RUN sudo apt update && sudo apt install -y graphviz
RUN sudo apt update && sudo apt install -y tree
RUN sudo apt update && sudo apt install -y net-tools
RUN sudo apt update && sudo apt install -y lsof
RUN sudo apt update && sudo apt install -y strace
RUN sudo apt update && sudo apt install -y linux-tools-`uname -r` linux-tools-generic
RUN sudo apt update && sudo apt install -y jq
RUN sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt install -y awscli
RUN sudo apt update && sudo apt install -y docker docker-compose
RUN sudo groupmod -g 999 docker
RUN sudo usermod -a -G docker dev

# TERRAFORM
# =========

ENV TERRAFORM_VERSION=0.11.11
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform.zip
RUN sudo unzip /tmp/terraform.zip -d /usr/local/bin

# BTRACE
# ======
ENV BTRACE_VERSION=1.3.11.3
ENV BTRACE_HOME=/usr/lib/btrace/btrace-$BTRACE_VERSION
RUN wget https://github.com/btraceio/btrace/releases/download/v$BTRACE_VERSION/btrace-bin-$BTRACE_VERSION.tgz -O /tmp/btrace.tar.gz
RUN sudo mkdir -p $BTRACE_HOME
RUN sudo tar -C $BTRACE_HOME -xf /tmp/btrace.tar.gz
ENV PATH=$BTRACE_HOME/bin:$PATH

# JENV
# ====
ENV JENV_HOME=$HOME/.jenv
RUN git clone https://github.com/jenv/jenv.git $JENV_HOME
ENV PATH=$JENV_HOME/bin:$PATH
RUN echo 'eval "$(jenv init -)"' >> ~/.zshrc
RUN echo 'eval "$(jenv init -)"' >> ~/.bash_profile
RUN eval "$(jenv init -)" && \
    jenv enable-plugin export && \
    jenv add /usr/lib/jvm/java-11-openjdk-amd64 && \
    jenv add /usr/lib/jvm/java-8-openjdk-amd64 && \
    jenv global 11.0
# add shared object file for perfasm profiling
ADD hsdis-amd64.so $HOME/.jenv/versions/11.0/lib/hsdis-amd64.so


# ENTRYPOINT
# ==========

ENTRYPOINT tmux

