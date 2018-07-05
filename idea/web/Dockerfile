FROM env/desktop/web


# INSTALL REQUIRED PACKAGES
RUN apt-get update && \
    apt-get install -y libsecret-1-0 \
                       gnome-keyring \
                       unzip

ENV IDE_VERSION WebStorm-2017.3.5

# INSTALL WEB-STORM
RUN wget https://download.jetbrains.com/webstorm/$IDE_VERSION.tar.gz
RUN tar -xzf $IDE_VERSION.tar.gz
RUN rm $IDE_VERSION.tar.gz

# SET USER
USER dev
ENV HOME /home/dev

# ADD SHORTCUTS
ENV IDE_BIN "/WebStorm-173.4674.32/bin/webstorm.sh"
ADD shortcuts.sh /home/dev/shortcuts.sh
RUN sudo chown dev:dev ~/shortcuts.sh
RUN echo "source /home/dev/shortcuts.sh" >> ~/.bashrc

# ADD CONFIG
ENV IDE_CONFIG_HOME /home/dev/.WebStorm2017.3
# ADD .Rider2017.3 $IDE_CONFIG_HOME
# RUN sudo chown -R dev:dev $IDE_CONFIG_HOME

# ADD PLUGIN INSTALL SCRIPT
ADD add_plugin.sh /home/dev/add_plugin.sh
WORKDIR /home/dev

# ADD VIM PLUGIN
ENV VIM_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=41383
RUN ./add_plugin.sh $VIM_PLUGIN_URL

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
