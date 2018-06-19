FROM env/desktop/java

ENV IDE_VERSION ideaIC-2018.1.5
ENV IDE_HOME idea-IC-181.5281.24

# INSTALL INTELLIJ
RUN wget -O $IDE_VERSION.tar.gz https://download.jetbrains.com/idea/$IDE_VERSION-no-jdk.tar.gz
RUN tar -xzf $IDE_VERSION.tar.gz
RUN rm $IDE_VERSION.tar.gz

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
ENV IDE_CONFIG_HOME /home/dev/.IdeaIC2017.3
ADD .IdeaIC2017.3 $IDE_CONFIG_HOME
RUN sudo chown -R dev:dev $IDE_CONFIG_HOME

# ADD PLUGIN INSTALL SCRIPT
ADD add_plugin.sh /home/dev/add_plugin.sh
WORKDIR /home/dev

# ADD VIM PLUGIN
ENV VIM_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=41383
RUN ./add_plugin.sh $VIM_PLUGIN_URL

# ADD LOMBOK PLUGIN
ENV LOMBOK_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=38691
RUN ./add_plugin.sh $LOMBOK_PLUGIN_URL

# ADD CHECKSTYLE PLUGIN
ENV CHECKSTYLE_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=42639
RUN ./add_plugin.sh $CHECKSTYLE_PLUGIN_URL

# ADD SAVE ACTIONS PLUGIN
ENV SAVE_ACTIONS_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=42637
RUN ./add_plugin.sh $SAVE_ACTIONS_PLUGIN_URL JAR saveActions

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
