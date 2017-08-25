FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL RUST
ENV RUST_VERSION <<RUST_VERSION>>
RUN echo "version: $RUST_VERSION"
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain <<RUST_VERSION>> -y

# SET UP CARGO ENV VARS
ENV CARGO_HOME $HOME/.cargo
ENV PATH $CARGO_HOME/bin:$PATH

# SET SRC PATH FOR RACER COMPLETION
RUN rustup component add rust-src
# TODO: ideally we'd set this using interpolation $(rustc --print sysroot)/lib/...
ENV RUST_SRC_PATH=$HOME/.rustup/toolchains/<<RUST_VERSION>>-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

## INSTALL RUST COMPLETIONS IN YCM
RUN cd $HOME/.vim/bundle/YouCompleteMe && \
    ./install.py --racer-completer

# INSTALL RUSTFMT
RUN cargo install rustfmt

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
