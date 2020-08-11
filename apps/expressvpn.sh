#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v expressvpn)" ]; then
  wget -O /tmp/expressvpn.deb 'https://download.expressvpn.xyz/clients/linux/expressvpn_2.6.0.32-1_amd64.deb'
  sudo dpkg -i /tmp/expressvpn.deb
  expressvpn activate
fi
