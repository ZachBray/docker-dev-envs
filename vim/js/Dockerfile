FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL NODEJS ETC.
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -  && \
    sudo apt-get update && \
    sudo apt-get install -y nodejs

# INSTALL YARN
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt-get update && \
    sudo apt-get install -y yarn

# INSTALL GLOBAL NPM PACKAGES
RUN sudo npm install -g eslint \
                        babel-eslint \
                        npm-check-updates

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
