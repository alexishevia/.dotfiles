#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v k6)" ]; then
  wget -O /tmp/k6.deb 'https://github.com/loadimpact/k6/releases/download/v0.31.1/k6-v0.31.1-amd64.deb'
  sudo dpkg -i /tmp/k6.deb
fi
