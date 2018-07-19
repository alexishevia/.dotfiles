#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v synergy)" ]; then
  wget -O /tmp/synergy.deb 'https://binaries.symless.com/synergy/v1-core-standard/v1.10.0-stable-275cdc1c/synergy_1.10.0.stable_b36%2B275cdc1c_debian_amd64.deb'
  sudo dpkg -i /tmp/synergy.deb
fi
