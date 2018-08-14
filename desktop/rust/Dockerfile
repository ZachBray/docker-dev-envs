FROM env/desktop/base

# SET USER
USER dev
ENV HOME /home/dev

# INSTALL GCC FOR LINKING
RUN sudo apt-get update && \
    sudo apt-get install -y gcc

# INSTALL RUST
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# SET UP CARGO ENV VARS
ENV CARGO_HOME $HOME/.cargo
ENV PATH $CARGO_HOME/bin:$PATH

# SET SRC PATH FOR RACER COMPLETION
RUN rustup component add rust-src
ENV RUST_SRC_PATH $HOME/.rustup/toolchains/$RUST_VERSION-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
