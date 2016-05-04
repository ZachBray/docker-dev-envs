FROM env/vim/js
MAINTAINER zachbray@googlemail.com

# INSTALL GLOBAL NPM PACKAGES
RUN sudo npm i -g typescript \
                  tslint

RUN git clone https://github.com/Shougo/vimproc.vim.git $HOME/.vim/bundle/vimproc.vim  && \
    cd $HOME/.vim/bundle/vimproc.vim                                                   && \
    make

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
