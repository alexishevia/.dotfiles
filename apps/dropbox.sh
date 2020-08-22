#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v dropbox)" ]; then
  wget -O /tmp/dropbox.deb 'https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb'
  sudo dpkg -i /tmp/dropbox.deb
  dropbox start -i
fi
