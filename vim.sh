#!/bin/bash

set -e # exit if any command fails

./dotfiles.sh

if [ -d ~/.vim ]; then
  sudo rm -r ~/.vim
fi

mkdir -p ~/.vim/autoload
wget -O ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins and quit vim
vim -c PlugInstall -c q! -c q!

# update vim-polyglot (required to avoid issue with vim-go)
# see: https://github.com/fatih/vim-go/issues/2045
cd ~/.vim/plugged/vim-polyglot
./build
