#!/bin/bash

set -e # exit if any command fails

if [ -e /etc/hosts ]
then
  sudo rm /etc/hosts
fi
sudo ln -i "$PWD/hosts" /etc/hosts
