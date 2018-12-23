FROM env/desktop

# SCRIPTS
# =======

ADD fix_vm_options.sh /home/dev/fix_vm_options.sh


# WEB STORM
# =========

ENV WEBSTORM_VERSION WebStorm-2018.3.2
ENV WEBSTORM_HOME "/$WEBSTORM_VERSION"
RUN wget -O webstorm.tar.gz https://download.jetbrains.com/webstorm/$WEBSTORM_VERSION.tar.gz
RUN sudo mkdir -p $WEBSTORM_HOME
RUN sudo tar -C $WEBSTORM_HOME -xzf webstorm.tar.gz --strip 1
RUN rm webstorm.tar.gz
RUN sudo bash fix_vm_options.sh $WEBSTORM_HOME/bin/webstorm64.vmoptions


# RIDER
# =====

ENV RIDER_VERSION Rider-2018.3
ENV RIDER_HOME "/$RIDER_VERSION"
RUN wget -O rider.tar.gz https://download.jetbrains.com/rider/JetBrains.$RIDER_VERSION.tar.gz
RUN sudo mkdir -p $RIDER_HOME
RUN sudo tar -C $RIDER_HOME -xzf rider.tar.gz --strip 1
RUN rm rider.tar.gz
RUN sudo bash fix_vm_options.sh $RIDER_HOME/bin/rider64.vmoptions


# INTELLIJ
# ========

ENV INTELLIJ_VERSION ideaIC-2018.3.2
ENV INTELLIJ_HOME /idea-IC-183.4886.37
RUN wget -O intellij.tar.gz https://download.jetbrains.com/idea/$INTELLIJ_VERSION-no-jdk.tar.gz
RUN sudo tar -C / -xzf intellij.tar.gz
RUN rm intellij.tar.gz
RUN sudo bash fix_vm_options.sh $INTELLIJ_HOME/bin/idea64.vmoptions


# PLUGINS
# =======

ADD add_plugin.sh /home/dev/add_plugin.sh

# editor config
RUN sudo ./add_plugin.sh $RIDER_HOME 46642
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 46642
RUN sudo ./add_plugin.sh $WEBSTORM_HOME 46642

# ideavim
RUN sudo ./add_plugin.sh $RIDER_HOME 51219
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 51219
RUN sudo ./add_plugin.sh $WEBSTORM_HOME 51219
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# save actions
RUN sudo ./add_plugin.sh $RIDER_HOME 48395 JAR saveActions
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 48395 JAR saveActions
RUN sudo ./add_plugin.sh $WEBSTORM_HOME 48395 JAR saveActions

# plantuml
RUN sudo ./add_plugin.sh $RIDER_HOME 50970
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 50970
RUN sudo ./add_plugin.sh $WEBSTORM_HOME 50970

# key promoter
RUN sudo ./add_plugin.sh $RIDER_HOME 47761
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 47761
RUN sudo ./add_plugin.sh $WEBSTORM_HOME 47761

# lombok
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 47623

# checkstyle
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 48315

# kotlin
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 51536

# rust
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 48624


# SHORTCUTS
# =========
ADD shortcuts.sh /home/dev/shortcuts.sh
RUN echo "source /home/dev/shortcuts.sh" >> ~/.zshrc


# SRC VOLUME
# ==========
VOLUME /home/dev/src
WORKDIR /home/dev/src

