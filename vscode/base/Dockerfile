FROM ubuntu:16.04

# INSTALL GTK ETC.
RUN apt-get update && \
    apt-get install -y libgtk2.0 \
                       libatk1.0 \
                       libpango1.0 \
                       libpangocairo-1.0 \
                       libcairo2 \
                       libfreetype6 \
                       libfontconfig1 \
                       libdbus-1-3 \
                       libxi6 \
                       libxcursor1 \
                       libxdamage1 \
                       libxrandr2 \
                       libxcomposite1 \
                       libxext6 \
                       libxfixes3 \
                       libxrender1 \
                       libxtst6 \
                       libgconf-2-4 \
                       libasound2 \
                       libcups2 \
                       libexpat1 \
                       libxss1

# INSTALL WGET
RUN apt-get update && \
    apt-get install -y wget

# INSTALL NODE
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

# INSTALL VSCODE
RUN wget -O vscode-amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868
RUN apt install -y ./vscode-amd64.deb
RUN rm vscode-amd64.deb

# INSTALL GIT
RUN apt-get update && \
    apt-get install -y git

# SET UP WORKSPACE
RUN apt-get update && \
    apt-get install -y sudo
RUN useradd dev && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV HOME /home/dev
RUN mkdir -p $HOME
RUN chown -R dev:dev $HOME/
USER dev
VOLUME $HOME/src
WORKDIR $HOME/src

# INSTALL VIM EXTENSIONS
RUN /usr/bin/code --install-extension vscodevim.vim
RUN /usr/bin/code --install-extension EditorConfig.editorconfig

# ADD VSCODE CONFIGURATION
ADD .config/Code/User $HOME/.config/Code/User

ENTRYPOINT /bin/bash
