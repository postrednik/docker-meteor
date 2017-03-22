FROM debian:latest
MAINTAINER Rostislav Postrednik http://postrednik.cz

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y \
        curl \
        sudo \
        git \
        build-essential \
        graphicsmagick \
        libssl-dev \
        libpng-dev

ENV NVM_DIR /usr/local/.nvm
ENV NODE_VERSION 5.6.0

# Install nvm
RUN git clone https://github.com/creationix/nvm.git $NVM_DIR && \
    cd $NVM_DIR && \
    git checkout `git describe --abbrev=0 --tags`

# Install default version of Node.js
RUN source $NVM_DIR/nvm.sh && \
    nvm install 0.10 && npm install -g coffee-script bower grunt-cli && \
    nvm ls-remote | \
    while IFS= read -r line \
    do \
        line="$(echo -e "${line}" | tr -d '[[:space:]]')" \
        if [[ $line =~ ^(v)[4,5,6,7].* ]] \
        then \
            line=$(echo $line | tr -c -d 0-9.) \
            nvm install $line --reinstall-packages-from=0.10 \
        fi \
    done && \
    nvm alias default 7 && \
    nvm use default

# Add nvm.sh to .bashrc for startup...
RUN echo "source ${NVM_DIR}/nvm.sh" > $HOME/.bashrc && \
    source $HOME/.bashrc

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

# Install meteor
RUN curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh

# Install rvm & ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    