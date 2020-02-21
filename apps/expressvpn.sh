#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v expressvpnZ)" ]; then
  wget -O /tmp/expressvpn.deb 'https://download.expressvpn.xyz/clients/linux/expressvpn_2.4.2-1_amd64.deb'
  sudo dpkg -i /tmp/expressvpn.deb
  expressvpn activate
fi
