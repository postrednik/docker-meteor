FROM debian:latest

MAINTAINER Rostislav Postrednik <rostislav@postrednik.cz>

RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    git

RUN curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh

USER root
ENV HOME /root
ENV NODE_VER stable

# setup the nvm environment
RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm
RUN echo '\n#The Following loads nvm, and install Node.js which version is assigned to $NODE_ENV' >> $HOME/.profile
RUN echo '. ~/.nvm/nvm.sh' >> $HOME/.profile
RUN echo 'echo "Installing node@${NODE_VER}, this may take several minutes..."' >> $HOME/.profile
RUN echo 'nvm install ${NODE_VER}' >> $HOME/.profile
RUN echo 'nvm alias default ${NODE_VER}' >> $HOME/.profile
RUN echo 'echo "Install node@${NODE_VER} finished."' >> $HOME/.profile
ENTRYPOINT ["/bin/bash", "--login", "-i", "-c"]
CMD ["bash"]

RUN nvm ls

# CMD ls ~/ -a
