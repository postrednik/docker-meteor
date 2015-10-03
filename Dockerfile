FROM debian:latest

MAINTAINER Rostislav Postrednik <rostislav@postrednik.cz>

RUN apt-get update && apt-get install -y \
    curl \
    git

RUN curl --silent https://install.meteor.com | /bin/sh

WORKDIR ~/

# CMD ls ~/ -a
