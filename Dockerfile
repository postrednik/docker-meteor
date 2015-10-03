FROM debian:latest

RUN apt-get update && apt-get install -y \
    curl \
    git

RUN curl --silent https://install.meteor.com | /bin/sh

# CMD ls ~/ -a
