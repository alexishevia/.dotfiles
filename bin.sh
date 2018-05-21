#!/bin/bash

set -e # exit if any command fails

if [ -d ~/bin ]
then
  sudo rm -r ~/bin
fi
cp -r bin ~/bin

# add desktop entry for 'hotlist' command
if [ -e  ~/.local/share/applications/hotlist.desktop ]
then
  rm ~/.local/share/applications/hotlist.desktop
fi
cp hotlist.desktop ~/.local/share/applications/hotlist.desktop

# add desktop entry for 'fresh-chrome' command
if [ -e  ~/.local/share/applications/fresh-chrome.desktop ]
then
  rm ~/.local/share/applications/fresh-chrome.desktop
fi
cp fresh-chrome.desktop ~/.local/share/applications/fresh-chrome.desktop

# install dep (golang)
if ! [ -x "$(command -v dep)" ]; then
  curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
fi

# map gnome-open to xdg-open
ln -s /usr/bin/xdg-open ~/bin/gnome-open
