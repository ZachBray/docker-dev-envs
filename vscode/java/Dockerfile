FROM env/vscode/base

USER root

RUN apt-get update && \
    apt-get install -y default-jdk \
                       maven

USER dev

# INSTALL VSCODE EXTENSIONS
RUN /usr/bin/code --install-extension vscjava.vscode-java-pack
RUN /usr/bin/code --install-extension vscjava.vscode-java-test
RUN /usr/bin/code --install-extension shengchen.vscode-checkstyle
RUN /usr/bin/code --install-extension eskibear.vscode-maven

# INSTALL LOMBOK
RUN mkdir -p ~/lombok
RUN curl -o ~/lombok/lombok.jar https://projectlombok.org/downloads/lombok.jar

# ADD VSCODE CONFIGURATION
# TODO: MERGE INSTEAD
ADD .config/Code/User $HOME/.config/Code/User
