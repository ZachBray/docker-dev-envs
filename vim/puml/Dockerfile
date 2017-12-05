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

# INSTALL FIREFOX FOR VIEWING PDFS
RUN sudo apt-get update && \
    sudo apt-get install -y xdg-utils firefox

# INSTALL NODEJS ETC. FOR LIVEDOWN
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -  && \
    sudo apt-get update && \
    sudo apt-get install -y nodejs

# INSTALL LIVEDOWN
RUN sudo npm i -g livedown

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
