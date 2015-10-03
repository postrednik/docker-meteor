FROM debian:latest

MAINTAINER Rostislav Postrednik <rostislav@postrednik.cz>

RUN apt-get update && apt-get install -y \
    curl \
    git

RUN curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash
RUN source ~/.nvm/nvm.sh
RUN nvm install node

WORKDIR ~/

# CMD ls ~/ -a
