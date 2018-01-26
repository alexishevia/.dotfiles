#!/bin/bash

if [ -d ~/.vim ]
then
  sudo rm -r ~/.vim
fi
cp -r .vim ~/.vim

# install plugins and quit
vim -c PlugInstall -c q! -c q!
