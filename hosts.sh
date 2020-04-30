#!/bin/bash

set -e # exit if any command fails

if [ -e /etc/hosts ]
then
  sudo rm /etc/hosts
fi
sudo ln -s "$PWD/hosts" /etc/hosts
