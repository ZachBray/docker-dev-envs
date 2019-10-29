FROM env/desktop

# SCRIPTS
# =======

ADD fix_vm_options.sh /home/dev/fix_vm_options.sh


# RIDER
# =====

ENV RIDER_VERSION Rider-2019.2
ENV RIDER_HOME "/$RIDER_VERSION"
RUN wget -O rider.tar.gz https://download.jetbrains.com/rider/JetBrains.$RIDER_VERSION.tar.gz
RUN sudo mkdir -p $RIDER_HOME
RUN sudo tar -C $RIDER_HOME -xzf rider.tar.gz --strip 1
RUN rm rider.tar.gz
RUN sudo bash fix_vm_options.sh $RIDER_HOME/bin/rider64.vmoptions


# ULTIMATE
# ========

ENV INTELLIJ_VERSION ideaIU-2019.2.3
ENV INTELLIJ_HOME /idea-IU-192.6817.14
RUN wget -O intellij.tar.gz https://download.jetbrains.com/idea/$INTELLIJ_VERSION-jbr8.tar.gz
RUN sudo tar -C / -xzf intellij.tar.gz
RUN rm intellij.tar.gz
RUN sudo bash fix_vm_options.sh $INTELLIJ_HOME/bin/idea64.vmoptions

# BROWSERS
# ========

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN sudo apt update && sudo apt install -y libappindicator3-1 xdg-utils
RUN sudo dpkg -i google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb

# PLUGINS
# =======

ADD add_plugin.sh /home/dev/add_plugin.sh

# editor config
RUN sudo ./add_plugin.sh $RIDER_HOME 46642
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 46642

# ideavim
RUN sudo ./add_plugin.sh $RIDER_HOME 68881
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 68881
ADD .ideavimrc $HOME
RUN sudo chown dev:dev $HOME/.ideavimrc

# save actions
RUN sudo ./add_plugin.sh $RIDER_HOME 61033 JAR saveActions
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 61033 JAR saveActions

# plantuml
RUN sudo ./add_plugin.sh $RIDER_HOME 68902
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 68902

# key promoter
RUN sudo ./add_plugin.sh $RIDER_HOME 68138
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 68138

# lombok
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 67665

# qaplug
# RUN sudo ./add_plugin.sh $INTELLIJ_HOME 60412

# qaplug-checkstyle
# RUN sudo ./add_plugin.sh $INTELLIJ_HOME 45265

# qaplug-findbugs
# RUN sudo ./add_plugin.sh $INTELLIJ_HOME 45264

# qaplug-pmd
# RUN sudo ./add_plugin.sh $INTELLIJ_HOME 47797

# toml
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 63629

# rust
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 69227

# antlr
RUN sudo ./add_plugin.sh $INTELLIJ_HOME 64387

# CONFIGURATION
# =============
ADD fix_keymap.sh /home/dev/fix_keymap.sh
ADD \$default.xml /home/dev/\$default.xml
RUN sudo bash -c "source /home/dev/.bashrc; ./fix_keymap.sh $RIDER_HOME"
RUN sudo bash -c "source /home/dev/.bashrc; ./fix_keymap.sh $INTELLIJ_HOME"

# SHORTCUTS
# =========
ADD shortcuts.sh /home/dev/shortcuts.sh
RUN echo "source /home/dev/shortcuts.sh" >> ~/.zshrc

# SRC VOLUME
# ==========
VOLUME /home/dev/src
WORKDIR /home/dev/src

