#!/bin/bash

set -e # exit if any command fails

if [ -d ~/.config/nvim ]; then
  sudo rm -r ~/.config/nvim
fi

mkdir -p ~/.config/nvim/autoload
wget -O ~/.config/nvim/autoload/plug.vim  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

./dotfiles.sh

# install plugins and exit
nvim -c PlugInstall -c q! -c q!

# install coc extensions and exit
nvim -c 'CocInstall -sync coc-css coc-eslint coc-go coc-json coc-tsserver' -c q! -c q!
