FROM env/desktop/dotnet

ENV IDE_VERSION Rider-2017.2

# INSTALL RIDER
RUN wget https://download.jetbrains.com/resharper/JetBrains.$IDE_VERSION.tar.gz
RUN tar -xzf JetBrains.$IDE_VERSION.tar.gz
RUN rm JetBrains.$IDE_VERSION.tar.gz

# INSTALL REQUIRED PACKAGES
RUN apt-get update && \
    apt-get install -y libsecret-1-0 \
                       gnome-keyring \
                       unzip

# SET USER
USER dev
ENV HOME /home/dev

# ADD SHORTCUTS
ADD shortcuts.sh /home/dev/shortcuts.sh
RUN sudo chown dev:dev ~/shortcuts.sh
RUN echo "source /home/dev/shortcuts.sh" >> ~/.bashrc

# ADD CONFIG
ADD .$IDE_VERSION /home/dev/.$IDE_VERSION
RUN sudo chown -R dev:dev ~/.$IDE_VERSION

# ADD VIM PLUGIN
ENV VIM_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=41383
RUN curl -SL $VIM_PLUGIN_URL --output ~/temp.zip
RUN mkdir -p ~/.$IDE_VERSION/config/plugins/
RUN unzip ~/temp.zip -d ~/.$IDE_VERSION/config/plugins/
RUN rm ~/temp.zip

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
