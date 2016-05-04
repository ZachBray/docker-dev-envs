FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL RUST
RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh

# INSTALL OMNISHARP COMPLETIONS IN YCM
RUN cd $HOME/.vim/bundle/YouCompleteMe                        && \
    ./install.py --racer-completer

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall

