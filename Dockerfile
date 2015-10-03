FROM debian:latest

MAINTAINER Rostislav Postrednik <rostislav@postrednik.cz>

RUN apt-get update && apt-get install -y \
    curl \
    git

RUN curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh

WORKDIR ~/

# CMD ls ~/ -a
