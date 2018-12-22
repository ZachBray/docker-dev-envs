FROM env/desktop/java

ENV IDE_VERSION ideaIC-2018.3.2

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
ENV IDE_HOME idea-IC-183.4886.37
ADD shortcuts.sh /home/dev/shortcuts.sh
RUN sudo chown dev:dev ~/shortcuts.sh
RUN sudo chown dev:dev ~/.zshrc
RUN echo "source /home/dev/shortcuts.sh" >> ~/.bashrc
RUN echo "source /home/dev/shortcuts.sh" >> ~/.zshrc

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
# ENV SONAR_LINT_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48286
# RUN ./add_plugin.sh $SONAR_LINT_PLUGIN_URL

# ADD SAVE ACTIONS PLUGIN
ENV SAVE_ACTIONS_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48395
RUN ./add_plugin.sh $SAVE_ACTIONS_PLUGIN_URL JAR saveActions

# ADD ACE JUMP PLUGIN
# ENV ACE_JUMP_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=44030
# RUN ./add_plugin.sh $ACE_JUMP_PLUGIN_URL

# ADD CUCUMBER PLUGIN
# ENV CUCUMBER_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=48206
# RUN ./add_plugin.sh $CUCUMBER_PLUGIN_URL

# ADD EDITOR CONFIG
ENV EDITOR_CONFIG_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=46642
RUN ./add_plugin.sh $EDITOR_CONFIG_PLUGIN_URL

# ADD KEY PROMOTER PLUGIN
ENV KEY_PROMOTER_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=47761
RUN ./add_plugin.sh $KEY_PROMOTER_PLUGIN_URL

# ADD KOTLIN PLUGIN
ENV KOTLIN_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=51536
RUN ./add_plugin.sh $KOTLIN_PLUGIN_URL

# ADD PLANTUML PLUGIN
RUN sudo apt update && sudo apt install -y graphviz
ENV PLANT_UML_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=50970
RUN ./add_plugin.sh $PLANT_UML_PLUGIN_URL

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

# FIX INTELLIJ VM OPTIONS TO GIVE MORE MEMORY
ENV IDE_VM_OPTIONS=/$IDE_HOME/bin/idea64.vmoptions
RUN sudo sed -i 1,3d $IDE_VM_OPTIONS
RUN echo "-Xms2048m" | sudo tee -a $IDE_VM_OPTIONS
RUN echo "-Xmx4096m" | sudo tee -a $IDE_VM_OPTIONS
RUN echo "-XX:ReservedCodeCacheSize=1024m" | sudo tee -a $IDE_VM_OPTIONS

# ADD DOTNET FOR X-PLATFORM BUILDS
RUN sudo apt-key adv --keyserver packages.microsoft.com --recv-keys EB3E94ADBE1229CF
RUN sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
RUN sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-bionic-prod bionic main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN sudo apt-get update
RUN sudo apt-get install apt-transport-https
RUN sudo apt-get update
RUN sudo apt install -y dotnet-sdk-2.1


ENTRYPOINT tmux
