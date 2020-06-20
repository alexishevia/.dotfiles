#!/bin/bash

set -e # exit if any command fails

# make sure nvim config folder exists
mkdir -p ~/.config/nvim

dotfiles='.ackrc .bash_profile .bashrc .gitconfig .psqlrc .tmux.conf .vimrc .czrc .ctags .agignore .grc .config/nvim/init.vim'

for df in $dotfiles; do
  if [ -e ~/$df ]
  then
    rm ~/$df
  fi
  if [ -L ~/$df ]
  then
    rm ~/$df
  fi
  ln -s "$PWD/$df" ~/$df
done

# source .bashrc
. ~/.bashrc
