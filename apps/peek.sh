#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v peek)" ]; then
  wget -O /tmp/peek 'https://github.com/phw/peek/releases/download/1.3.1/peek-1.3.1-0-x86_64.AppImage'
  sudo mv /tmp/peek /usr/local/bin/peek
  sudo chmod +x /usr/local/bin/peek
fi

sudo cp ./apps/peek.png /usr/share/icons/peek.png
cat ./apps/peek.desktop > ~/.local/share/applications/peek.desktop
