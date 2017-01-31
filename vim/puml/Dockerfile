FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL JDK ETC.
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-8-jdk   \
                            ant             \
                            maven           \
                            build-essential

# SET UP PLANT UML
ENV PLANT_UML_JAR $HOME/.vim/bundle/vim-slumlord/plantuml.jar
ADD plantuml /usr/bin

# INSTALL GRAPHVIZ
RUN sudo apt-get update && \
    sudo apt-get install -y graphviz

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
