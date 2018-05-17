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

./dropbox.sh
./postman.sh
./fiddler.sh
