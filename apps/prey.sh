#!/usr/bin/env bash

set -e # exit if any command fails

if [ ! -d /etc/prey ]; then
  wget -O /tmp/prey.deb 'https://downloads.preyproject.com/prey-client-releases/node-client/1.7.5/prey_1.7.5_amd64.deb'
  sudo dpkg -i /tmp/prey.deb
fi
