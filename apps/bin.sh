#!/bin/bash

set -e # exit if any command fails

if [ -d ~/bin ]; then
  rm -r ~/bin
fi
cp -r ./apps/home_bins ~/bin

# add desktop entry for 'hotlist' command
cat ./apps/hotlist.desktop > ~/.local/share/applications/hotlist.desktop

# add desktop entry for 'fresh-chrome' command
sudo cp ./apps/chromium.png /usr/share/icons/chromium.png
cat ./apps/fresh-chrome.desktop > ~/.local/share/applications/fresh-chrome.desktop

# install dep (golang)
if ! [ -x "$(command -v dep)" ]; then
  curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
fi

# install glide (golang)
if ! [ -x "$(command -v glide)" ]; then
  curl https://glide.sh/get | sh
fi


# map gnome-open to xdg-open
ln -s /usr/bin/xdg-open ~/bin/gnome-open
