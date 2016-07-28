FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL NODEJS ETC.
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -  && \
    sudo apt-get install -y nodejs 

# INSTALL GLOBAL NPM PACKAGES
RUN sudo npm i -g eslint                                            \
                  babel-eslint

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
