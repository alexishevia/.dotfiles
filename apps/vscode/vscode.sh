#!/bin/bash

set -e # exit if any command fails

files='settings.json keybindings.json'
path="$HOME/.config/Code/User"

if ! [ -e $path ]; then
   mkdir -p $path
fi

for file in $files; do
  if [ -e $path/$file ]
  then
    rm $path/$file
  fi
  ln -s "$PWD/apps/vscode/$file" $path/$file
done
