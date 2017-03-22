#!/bin/bash

source /usr/local/.nvm/nvm.sh

nvm install 0.10 && npm install -g coffee-script bower grunt-cli
nvm ls-remote |
  while IFS= read -r line
  do
    line="$(echo -e "${line}" | tr -d '[[:space:]]')"
    if [[ $line =~ ^(v)[4,5,6,7].* ]]
    then
        line=$(echo $line | tr -c -d 0-9.)
        nvm install $line --reinstall-packages-from=0.10
    fi
  done

nvm alias default 7
nvm use default
