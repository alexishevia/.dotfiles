#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v robo3t)" ]; then
  echo "installing robo3t (aka robomongo)"
  wget -O /tmp/robomongo.tar.gz 'https://download.studio3t.com/robomongo/linux/robo3t-1.4.2-linux-x86_64-8650949.tar.gz'
  sudo mkdir /usr/local/robo3t
  sudo tar -xzf /tmp/robomongo.tar.gz -C /usr/local/robo3t --strip-components 1
  sudo ln -s /usr/local/robo3t/bin/robo3t /usr/local/bin/robo3t
fi

