#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v teams)" ]; then
  wget -O /tmp/teams.deb 'https://go.microsoft.com/fwlink/p/?linkid=2112886&clcid=0x409&culture=en-us&country=us'
  sudo dpkg -i /tmp/teams.deb
fi
