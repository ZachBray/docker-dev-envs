FROM env/desktop/dotnet

ENV IDE_VERSION Rider-2017.3

# INSTALL RIDER
RUN wget https://download.jetbrains.com/resharper/JetBrains.$IDE_VERSION.tar.gz
RUN tar -xzf JetBrains.$IDE_VERSION.tar.gz
RUN rm JetBrains.$IDE_VERSION.tar.gz

# PREPARE MONO REPOS
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN apt-get install -y apt-transport-https
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

# INSTALL REQUIRED PACKAGES
RUN apt-get update && \
    apt-get install -y libsecret-1-0 \
                       gnome-keyring \
                       unzip \
                       mono-complete \
                       msbuild \
                       fsharp

# SET USER
USER dev
ENV HOME /home/dev

# ADD SHORTCUTS
ENV IDE_BIN "/JetBrains $IDE_VERSION/bin/rider.sh"
ADD shortcuts.sh /home/dev/shortcuts.sh
RUN sudo chown dev:dev ~/shortcuts.sh
RUN echo "source /home/dev/shortcuts.sh" >> ~/.bashrc

# ADD CONFIG
ENV IDE_CONFIG_HOME /home/dev/.Rider2017.3
ADD .Rider2017.3 $IDE_CONFIG_HOME
RUN sudo chown -R dev:dev $IDE_CONFIG_HOME

# ADD PLUGIN INSTALL SCRIPT
ADD add_plugin.sh /home/dev/add_plugin.sh
WORKDIR /home/dev

# ADD VIM PLUGIN
ENV VIM_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=41383
RUN ./add_plugin.sh $VIM_PLUGIN_URL

# ADD ACE JUMP PLUGIN
ENV ACE_JUMP_PLUGIN_URL https://plugins.jetbrains.com/plugin/download?rel=true&updateId=44030
RUN ./add_plugin.sh $ACE_JUMP_PLUGIN_URL

# ADD IDEAVIM CONFIGURATION
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# ADD MOUNT POINT
VOLUME /home/dev/src
WORKDIR /home/dev/src

ENTRYPOINT /bin/bash
