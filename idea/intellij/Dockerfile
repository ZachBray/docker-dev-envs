FROM env/desktop/java

ENV IDE_VERSION ideaIC-2018.2.1

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
ENV IDE_HOME idea-IC-182.3911.36
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
ENV LOMBOK_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=47623
RUN ./add_plugin.sh $LOMBOK_PLUGIN_URL

# ADD CHECKSTYLE PLUGIN
ENV CHECKSTYLE_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48315
RUN ./add_plugin.sh $CHECKSTYLE_PLUGIN_URL

# ADD SONAR LINT PLUGIN
ENV SONAR_LINT_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48286
RUN ./add_plugin.sh $SONAR_LINT_PLUGIN_URL

# ADD SAVE ACTIONS PLUGIN
ENV SAVE_ACTIONS_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48395
RUN ./add_plugin.sh $SAVE_ACTIONS_PLUGIN_URL JAR saveActions

# ADD ACE JUMP PLUGIN
ENV ACE_JUMP_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=44030
RUN ./add_plugin.sh $ACE_JUMP_PLUGIN_URL

# ADD CUCUMBER PLUGIN
ENV CUCUMBER_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48206
RUN ./add_plugin.sh $CUCUMBER_PLUGIN_URL

# ADD EDITOR CONFIG
ENV EDITOR_CONFIG_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=46642
RUN ./add_plugin.sh $EDITOR_CONFIG_PLUGIN_URL

# ADD KEY PROMOTER PLUGIN
ENV KEY_PROMOTER_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=47761
RUN ./add_plugin.sh $KEY_PROMOTER_PLUGIN_URL

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
