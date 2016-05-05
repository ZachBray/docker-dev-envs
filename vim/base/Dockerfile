FROM ubuntu:latest
MAINTAINER zachbray@googlemail.com

# INSTALL DEPENDENCIES
RUN apt-get update                                                                                    && \
    apt-get install -y sudo                                                                              \
                       curl                                                                              \
                       git                                                                               \
                       vim-nox-py2                                                                       \
                       build-essential                                                                   \
                       cmake                                                                             \
                       python-dev                                                                        \
                       python3-dev                                                                       \
                       silversearcher-ag

# ADD + SWITCH TO DEV USER
RUN useradd dev                                                                                       && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /home/dev 
ENV HOME /home/dev
RUN chown -R dev:dev $HOME/
USER dev

# INSTALL VUNDLE
RUN git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# INSTALL YCM
RUN git clone https://github.com/Valloric/YouCompleteMe.git $HOME/.vim/bundle/YouCompleteMe           && \
    cd $HOME/.vim/bundle/YouCompleteMe                                                                && \
    git submodule update --init --recursive                                                           && \
    ./install.py

# ADD VIM CONFIGURATION
ADD home $HOME
RUN sudo chown -R dev:dev $HOME/.vim

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall

# IMPORT CODE
VOLUME /home/dev/src
WORKDIR /home/dev/src

# START VIM
ENV TERM xterm-256color 
ENTRYPOINT vim
