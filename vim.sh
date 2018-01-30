#!/bin/bash

set -e # exit if any command fails

if [ -d ~/.vim ]
then
  sudo rm -r ~/.vim
fi
cp -r .vim ~/.vim

# install plugins and quit
vim -c PlugInstall -c q! -c q!
