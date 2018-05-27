#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v openshot)" ]; then
  repo='OpenShot/openshot-qt'
  latest=$(curl --silent "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
  wget -O /tmp/openshot "https://github.com/${repo}/releases/download/${latest}/OpenShot-${latest}-x86_64.AppImage"
  sudo mv /tmp/openshot /usr/local/bin/openshot
  sudo chmod +x /usr/local/bin/openshot
fi

sudo cp ./apps/openshot.png /usr/share/icons/openshot.png
cat ./apps/openshot.desktop > ~/.local/share/applications/openshot.desktop
