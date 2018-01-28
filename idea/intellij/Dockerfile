FROM env/desktop/java

ENV IDE_VERSION ideaIC-2017.3.3
ENV IDE_HOME idea-IC-173.4301.25

# INSTALL RIDER
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

# ADD VIM PLUGIN
ENV VIM_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=41383
RUN curl -SL $VIM_PLUGIN_URL --output $HOME/temp.zip
RUN mkdir -p $IDE_CONFIG_HOME/config/plugins/
RUN unzip $HOME/temp.zip -d $IDE_CONFIG_HOME/config/plugins/
RUN rm $HOME/temp.zip

# ADD LOMBOK PLUGIN
ENV LOMBOK_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=38691
RUN curl -SL $LOMBOK_PLUGIN_URL --output $HOME/temp.zip
RUN mkdir -p $IDE_CONFIG_HOME/config/plugins/
RUN unzip $HOME/temp.zip -d $IDE_CONFIG_HOME/config/plugins/
RUN rm $HOME/temp.zip

# ADD CHECKSTYLE PLUGIN
ENV CHECKSTYLE_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=42639
RUN curl -SL $CHECKSTYLE_PLUGIN_URL --output $HOME/temp.zip
RUN mkdir -p $IDE_CONFIG_HOME/config/plugins/
RUN unzip $HOME/temp.zip -d $IDE_CONFIG_HOME/config/plugins/
RUN rm $HOME/temp.zip

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
