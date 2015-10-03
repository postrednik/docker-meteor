FROM debian:latest

MAINTAINER Rostislav Postrednik <rostislav@postrednik.cz>

RUN apt-get update && apt-get install -y \
    curl \
    git

RUN curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh

RUN curl --location https://raw.github.com/creationix/nvm/master/install.sh | sh && \
    sudo /bin/bash -c "echo \"[[ -s \$HOME/.nvm/nvm.sh ]] && . \$HOME/.nvm/nvm.sh\" >> /etc/profile.d/npm.sh" && \
    echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh" >> $HOME/.bashrc
ENV PATH $HOME/.nvm/bin:$PATH
RUN nvm install node

WORKDIR ~/

# CMD ls ~/ -a
