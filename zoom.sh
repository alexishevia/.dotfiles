#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v zoom)" ]; then
  wget -O /tmp/zoom.deb 'https://zoom.us/client/latest/zoom_amd64.deb'
  sudo dpkg -i /tmp/zoom.deb
fi
