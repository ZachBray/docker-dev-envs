FROM env/idea/intellij

# INSTALL RUST
ENV RUST_VERSION nightly
RUN echo "version: $RUST_VERSION"
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain $RUST_VERSION -y

# SET UP CARGO ENV VARS
ENV CARGO_HOME $HOME/.cargo
ENV PATH $CARGO_HOME/bin:$PATH

# SET SRC PATH FOR RACER COMPLETION
RUN rustup component add rust-src
ENV RUST_SRC_PATH $HOME/.rustup/toolchains/$RUST_VERSION-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# INSTALL GCC FOR LINKING
RUN sudo apt-get update && \
    sudo apt-get install -y gcc

# ADD RUST PLUGIN
ENV RUST_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=46640
RUN bash ~/add_plugin.sh $RUST_PLUGIN_URL
