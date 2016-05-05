FROM env/vim/base
MAINTAINER zachbray@googlemail.com


# INSTALL RUST
ENV RUST_VERSION=1.8.0
RUN curl -sf https://static.rust-lang.org/rustup.sh | sudo sh -s -- --revision=$RUST_VERSION

# INSTALL RUST SOURCE
ENV RUST_SRC_HOME=/usr/local/src/rust
ENV RUST_SRC_PATH=$RUST_SRC_HOME/src
RUN cd /tmp                                                                     && \
    curl -sO https://static.rust-lang.org/dist/rustc-$RUST_VERSION-src.tar.gz   && \
    tar -xvzf rustc-$RUST_VERSION-src.tar.gz                                    && \
    cd rustc-$RUST_VERSION                                                      && \
    sudo mkdir -p $RUST_SRC_HOME                                                && \
    sudo mv src $RUST_SRC_HOME                                                  && \
    sudo find $RUST_SRC_HOME -type d -exec chmod a+x {} \;                      && \
    sudo chmod -R a+r $RUST_SRC_HOME                                            && \
    sudo rm -rf /tmp/*


# INSTALL OMNISHARP COMPLETIONS IN YCM
RUN cd $HOME/.vim/bundle/YouCompleteMe && \
    ./install.py --racer-completer

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall

