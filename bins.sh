#!/bin/bash

set -e # exit if any command fails

if [ -d ~/bin ]; then
  rm -r ~/bin
fi
cp -r ./home_bins ~/bin

# add desktop entry for 'fresh-chrome' command
sudo cp ./apps/chromium.png /usr/share/icons/chromium.png
cat ./apps/fresh-chrome.desktop > ~/.local/share/applications/fresh-chrome.desktop

# map gnome-open to xdg-open
ln -s /usr/bin/xdg-open ~/bin/gnome-open
