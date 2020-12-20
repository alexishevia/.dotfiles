#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v civo)" ]; then
  wget -O /tmp/civo.deb 'https://github.com/civo/cli/releases/download/v0.6.46/civo_amd64.deb'
  sudo dpkg -i /tmp/civo.deb
fi
