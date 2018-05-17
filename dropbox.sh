#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v dropbox)" ]; then
  wget -O /tmp/dropbox.deb 'https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb'
  sudo dpkg -i /tmp/dropbox.deb
  dropbox start
fi

