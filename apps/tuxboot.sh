#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v tuxboot)" ]; then
  wget -O /tmp/tuxboot.deb 'https://sourceforge.net/projects/tuxboot/files/0.8/Linux/debian-amd64/tuxboot_0.8debian1_amd64.deb/download'
  sudo dpkg -i /tmp/tuxboot.deb
fi
