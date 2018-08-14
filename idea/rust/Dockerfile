FROM env/desktop/rust

ENV IDE_VERSION ideaIC-2018.2.1

# INSTALL INTELLIJ
ENV IDE_HOME $HOME/idea
RUN mkdir $IDE_HOME && \
    wget -O $IDE_HOME/$IDE_VERSION.tar.gz http://download.jetbrains.com/idea/$IDE_VERSION.tar.gz
RUN tar -xzf $IDE_HOME/$IDE_VERSION.tar.gz -C $IDE_HOME
RUN rm $IDE_HOME/$IDE_VERSION.tar.gz

# INSTALL REQUIRED PACKAGES
RUN sudo apt-get update && \
    sudo apt-get install -y libsecret-1-0 \
                            gnome-keyring \
                            unzip

# ADD SHORTCUTS
ENV IDE_BUILD idea-IC-182.3911.36
ADD shortcuts.sh /home/dev/shortcuts.sh
RUN sudo chown dev:dev ~/shortcuts.sh
RUN echo "source /home/dev/shortcuts.sh" >> ~/.bashrc

# ADD CONFIG
ENV IDE_CONFIG_HOME /home/dev/.IdeaIC2017.3
ADD .IdeaIC2017.3 $IDE_CONFIG_HOME
RUN sudo chown -R dev:dev $IDE_CONFIG_HOME

# ADD PLUGIN INSTALL SCRIPT
ADD add_plugin.sh /home/dev/add_plugin.sh
WORKDIR /home/dev

# ADD VIM PLUGIN
ENV VIM_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=41383
RUN ./add_plugin.sh $VIM_PLUGIN_URL

# ADD SAVE ACTIONS PLUGIN
ENV SAVE_ACTIONS_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=42637
RUN ./add_plugin.sh $SAVE_ACTIONS_PLUGIN_URL JAR saveActions

# ADD ACE JUMP PLUGIN
ENV ACE_JUMP_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=44030
RUN ./add_plugin.sh $ACE_JUMP_PLUGIN_URL

# ADD RUST PLUGIN
ENV RUST_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48624
RUN bash ~/add_plugin.sh $RUST_PLUGIN_URL

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
