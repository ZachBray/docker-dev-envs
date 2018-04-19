FROM env/vim/base
MAINTAINER zachbray@googlemail.com

RUN sudo apt-get update && \
    sudo apt-get install wget

# INSTALL OPAM
RUN wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin
RUN opam init
RUN eval `opam config env`
RUN sudo apt-get update && \
    sudo apt-get install -y m4

# INSTALL MERLIN
RUN opam install merlin

# CONFIGURE VIM
RUN mv ~/.vimrc ~/.vimrc.backup
RUN opam user-setup install
RUN cat ~/.vimrc.backup >> ~/.vimrc

# INSTALL COMMON PACKAGES
RUN opam install batteries core lwt

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall

# SET UP PROFILE
ENV PATH $HOME/.opam/system/bin:$PATH
RUN echo -n ". ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true" >> ~/.profile

ENTRYPOINT bash -l -c vim
