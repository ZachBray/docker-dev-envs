FROM env/desktop/dotnet

# INSTALL RIDER
RUN wget https://download.jetbrains.com/resharper/JetBrains.Rider-2017.2.tar.gz &&\
    tar -xzf JetBrains.Rider-2017.2.tar.gz

# INSTALL REQUIRED PACKAGES
RUN apt-get update && \
    apt-get install -y libsecret-1-0 \
                       gnome-keyring \
                       unzip

# ADD SHORTCUTS
ADD shortcuts.sh /root/shortcuts.sh
RUN echo "source /root/shortcuts.sh" >> /root/.bashrc

# ADD CONFIG
ADD .Rider-2017.2 /root/.Rider-2017.2

# ADD VIM PLUGIN
ENV VIM_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=41383
RUN curl -SL $VIM_PLUGIN_URL --output /root/temp.zip
RUN mkdir -p /root/.Rider-2017.2/config/plugins/
RUN unzip /root/temp.zip -d /root/.Rider-2017.2/config/plugins/
RUN rm /root/temp.zip

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
