#!/bin/bash

set -e # exit if any command fails

path="$HOME/.config/Code/User"
if ! [ -e $path ]; then
   mkdir -p $path
fi

files='settings.json keybindings.json'
for file in $files; do
  if [ -e $path/$file ]
  then
    rm $path/$file
  fi
  ln -s "$PWD/apps/vscode/$file" $path/$file
done

extensions='vscodevim.vim ms-vscode.go eamodio.gitlens alanwalk.markdown-toc alexishevia.mdo-extension-code'
for extension in $extensions; do
  code --install-extension $extension
done
