#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v zettlr)" ]; then
  wget -O /tmp/zettlr.deb 'https://github.com/Zettlr/Zettlr/releases/download/v1.5.0/Zettlr-1.5.0-amd64.deb'
  sudo dpkg -i /tmp/zettlr.deb
fi

