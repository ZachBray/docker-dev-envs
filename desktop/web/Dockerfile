FROM env/desktop/base

# INSTALL NODEJS ETC.
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -  && \
    sudo apt-get update && \
    sudo apt-get install -y nodejs

# INSTALL YARN
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt-get update && \
    sudo apt-get install -y yarn

# INSTALL GLOBAL NPM PACKAGES
RUN sudo yarn global add typescript \
                         tslint
