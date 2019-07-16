#!/bin/bash

set -e # exit if any command fails

dotfiles='.ackrc .bash_profile .bashrc .gitconfig .psqlrc .tmux.conf .eslintrc.js .vimrc .czrc .ctags .agignore'

for df in $dotfiles; do
  if [ -e ~/$df ]
  then
    rm ~/$df
  fi
  cp $df ~/$df
done


./apps/vscode/vscode.sh
