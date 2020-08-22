#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v code)" ]; then
  wget -O /tmp/vscode.deb 'https://go.microsoft.com/fwlink/?LinkID=760868'
  sudo dpkg -i /tmp/vscode.deb
fi
