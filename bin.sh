#!/bin/bash

set -e # exit if any command fails

if [ -d ~/bin ]
then
  sudo rm -r ~/bin
fi
cp -r bin ~/bin

./postman.sh
