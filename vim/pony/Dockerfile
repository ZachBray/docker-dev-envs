FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL PONY DEPENDENCIES
RUN sudo apt-get update               && \
    sudo apt-get install -y make         \
                       g++               \
                       git               \
                       zlib1g-dev        \
                       libncurses5-dev   \
                       libssl-dev        \
                       llvm-dev          \
                       libpcre2-dev   && \
    sudo rm -rf /var/lib/apt/lists/*

# CLONE PONY SOURCE
RUN mkdir /home/dev/pony              && \
    git clone https://github.com/ponylang/ponyc.git /home/dev/pony

# COMPILE PONY
RUN cd /home/dev/pony                 && \
    sudo make config=release install       && \ 
    sudo rm -rf /home/dev/pony/build

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
