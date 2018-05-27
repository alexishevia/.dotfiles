#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v postman)" ]; then
  wget -O /tmp/postman.tar.gz https://dl.pstmn.io/download/latest/linux64
  sudo tar -xzf /tmp/postman.tar.gz -C /opt
  sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
fi

cat ./apps/postman.desktop > ~/.local/share/applications/postman.desktop
