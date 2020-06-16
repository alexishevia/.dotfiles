#!/bin/bash

set -e # exit if any command fails

dotfiles='.ackrc .bash_profile .bashrc .gitconfig .psqlrc .tmux.conf .vimrc .czrc .ctags .agignore'

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

. ~/.bashrc
