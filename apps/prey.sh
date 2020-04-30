#!/usr/bin/env bash

set -e # exit if any command fails

if [ ! -d /etc/prey ]; then
  wget -O /tmp/prey.deb 'https://downloads.preyproject.com/prey-client-releases/node-client/1.9.4/prey_1.9.4_amd64.deb'
  sudo dpkg -i /tmp/prey.deb
fi
