#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v peek)" ]; then
  latest=$(curl --silent "https://api.github.com/repos/phw/peek/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
  wget -O /tmp/peek "https://github.com/phw/peek/releases/download/${latest}/peek-${latest}-0-x86_64.AppImage"
  sudo mv /tmp/peek /usr/local/bin/peek
  sudo chmod +x /usr/local/bin/peek
fi

sudo cp ./apps/peek.png /usr/share/icons/peek.png
cat ./apps/peek.desktop > ~/.local/share/applications/peek.desktop