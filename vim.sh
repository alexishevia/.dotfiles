#!/bin/bash

set -e # exit if any command fails

if [ -e ~/.vimrc ]
then
  rm ~/.vimrc
fi
cp .vimrc ~/.vimrc

if [ -d ~/.vim ]
then
  sudo rm -r ~/.vim
fi
cp -r .vim ~/.vim

# install plugins and quit
vim -c PlugInstall -c q! -c q!
