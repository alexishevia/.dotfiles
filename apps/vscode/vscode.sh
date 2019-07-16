#!/bin/bash

set -e # exit if any command fails

files='settings.json keybindings.json'
path="$HOME/.config/Code/User"

for file in $files; do
  if [ -e $path/$file ]
  then
    rm $path/$file
  fi
  cp ./apps/vscode/$file $path/$file
done
