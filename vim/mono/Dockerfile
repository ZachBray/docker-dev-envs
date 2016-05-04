FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL MONO + FSHARP
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF           && \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list  && \
    sudo apt-get update                                                                                                       && \
    sudo apt-get install -y mono-complete fsharp

# INSTALL OMNISHARP COMPLETIONS IN YCM
RUN cd $HOME/.vim/bundle/YouCompleteMe                        && \
    ./install.py --omnisharp-completer

# INSTALL OMNISHARP
RUN cd $HOME/.vim/bundle                                      && \
    git clone https://github.com/OmniSharp/omnisharp-vim.git  && \
    cd omnisharp-vim                                          && \
    git submodule update --init --recursive                   && \
    cd server                                                 && \
    xbuild

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall

