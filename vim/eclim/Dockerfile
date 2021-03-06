FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL JDK ETC.
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-8-jdk   \
                            ant             \
                            maven           \
                            xvfb            \
                            build-essential

# INSTALL ECLIPSE
RUN cd $HOME                                                                                                                                        && \
    curl http://ftp.fau.de/eclipse/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz | tar zx --directory $HOME

ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

# INSTALL LOMBOK
RUN cd $HOME && \
    curl -LO https://projectlombok.org/downloads/lombok.jar && \
    java -jar lombok.jar install $HOME/eclipse

# INSTALL SCALA PLUGIN
RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director \
-repository \
http://download.scala-ide.org/sdk/lithium/e46/scala211/stable/site \
-installIU \
org.scala-ide.sdt.feature.feature.group,\
org.scala-ide.zinc.feature.feature.group,\
org.scala-ide.scala211.feature.feature.group \
-uninstallIU \
org.eclipse.m2e.logback.feature.feature.group

# INSTALL ECLIM
RUN cd $HOME && \
    curl -LO https://github.com/ervandew/eclim/releases/download/2.6.0/eclim_2.6.0.jar && \
    java -Dvim.files=$HOME/.vim -Declipse.home=$HOME/eclipse -jar eclim_2.6.0.jar install && \
    rm eclim_2.6.0.jar

# INSTALL VIMPROC
RUN git clone https://github.com/Shougo/vimproc.vim.git $HOME/.vim/bundle/vimproc.vim  && \
    cd $HOME/.vim/bundle/vimproc.vim                                                   && \
    make

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall

ENTRYPOINT Xvfb :1 -screen 0 1024x768x24     & \
           cd $HOME                         && \
           DISPLAY=:1 ./eclipse/eclimd -b   && \
           cd $HOME/src                     && \
           vim
