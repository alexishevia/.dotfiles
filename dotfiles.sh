#!/bin/bash

dotfiles='.ackrc .bash_profile .bashrc .gitconfig .gitmessage .psqlrc .tmux.conf .eslintrc.js .vimrc'
dirs='bin .vim'

for df in $dotfiles; do
  if [ -e ~/$df ]
  then
    rm ~/$df
  fi
  cp $df ~/$df
done

for dir in $dirs; do
  if [ -d ~/$dir ]
  then
    rm -r ~/$dir
  fi
  cp -r $dir ~/$dir
done
