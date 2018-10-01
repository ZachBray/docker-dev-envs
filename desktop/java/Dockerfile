FROM env/desktop/base

# INSTALL JDK
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk

# REPLACE DEFAULT SHELL WITH BASH
RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh

# INSTALL SDKMAN + USEFUL PACKAGES
RUN apt-get update && \
    apt-get install -y zip unzip curl
ENV SDKMAN_DIR=/usr/local/sdkman
RUN curl -s "https://get.sdkman.io" | bash
RUN source "$SDKMAN_DIR/bin/sdkman-init.sh" && \
    sdk install maven && \
    sdk install kotlin && \
    sdk install kscript
