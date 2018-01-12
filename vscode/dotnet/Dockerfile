FROM env/vscode/base

USER root

# INSTALL .NET CLI DEPENDENCIES
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libcurl3 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu55 \
        liblttng-ust0 \
        libssl1.0.0 \
        libstdc++6 \
        libunwind8 \
        libuuid1 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

# INSTALL .NET CORE SDK
ENV DOTNET_SDK_VERSION 2.1.3
ENV DOTNET_SDK_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz
ENV DOTNET_SDK_DOWNLOAD_SHA 509b88895fd5a6a90e245141eb52f188aa9ee7d20188c213892483c142900d6975013aef9ca6d8da986cc5617a2c3571e22318297c51578b871c047602757600

RUN curl -SL $DOTNET_SDK_DOWNLOAD_URL --output dotnet.tar.gz \
    && echo "$DOTNET_SDK_DOWNLOAD_SHA dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# TRIGGER THE POPULATION OF THE LOCAL PACKAGE CACHE
ENV NUGET_XMLDOC_MODE skip
RUN mkdir warmup \
    && cd warmup \
    && dotnet new \
    && cd .. \
    && rm -rf warmup \
    && rm -rf /tmp/NuGetScratch

# MAKE SURE DEV USER HAS OWNERSHIP OF THE DOTNET CACHE ETC.
RUN chown -R dev $HOME/.templateengine
RUN chown -R dev $HOME/.dotnet

USER dev

# INSTALL VSCODE EXTENSIONS
RUN /usr/bin/code --install-extension ms-vscode.csharp
