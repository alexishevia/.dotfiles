#!/bin/bash

dotfiles='.ackrc .bash_profile .bashrc'
for df in $dotfiles; do
  if [ -e ~/$df ]
  then
    rm ~/$df
  fi
  cp $df ~/$df
done
