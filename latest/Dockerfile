FROM debian:latest
MAINTAINER Rostislav Postrednik http://postrednik.cz

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y \
        curl \
        sudo \
        git \
        build-essential \
        libssl-dev

ENV NVM_DIR /usr/local/.nvm

# Install nvm
RUN git clone https://github.com/creationix/nvm.git $NVM_DIR && \
    cd $NVM_DIR && \
    git checkout `git describe --abbrev=0 --tags` && \
    git describe --tags `git rev-list --tags --max-count=1` > version && \
    export NODE_VERSION=$(cat version)

# ENV NODE_VERSION "$(cat version)"

# Install default version of Node.js
RUN source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

# Add nvm.sh to .bashrc for startup...
RUN echo "source ${NVM_DIR}/nvm.sh" > $HOME/.bashrc && \
    source $HOME/.bashrc

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

# Install meteor
RUN curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh
