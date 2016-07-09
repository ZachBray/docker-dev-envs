FROM env/vim/base
MAINTAINER zachbray@googlemail.com

# INSTALL OCAML
RUN sudo apt-get install -y ocaml \
                            ocaml-native-compilers \
#                           ocaml-doc \
                            ocaml-findlib \
                            oasis \
                            libpcre-ocaml-dev \
                            opam \
                            m4

# CONFIGURE ENVIRONMENT
RUN opam init && \
    eval `opam config env` && \
    opam config setup --all

# INSTALL MERLIN
RUN opam install merlin

# INSTALL COMMON PACKAGES
RUN opam install batteries core lwt

# ENSURE OPAM BINARIES ARE IN PATH
#ENV SHELL /bin/bash
#ENV BASH_ENV ~/.profile
ENV PATH $HOME/.opam/system/bin:$PATH

# ADD VIM CONFIGURATION
ADD home $HOME

# INSTALL VIM PLUGINS
RUN vim -u $HOME/.vim/plugins.vim +PluginInstall +qall
