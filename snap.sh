#!/bin/bash

set -e # exit if any command fails

# install --classic snap packages I use
PACKAGES=""
PACKAGES+=" skype"
PACKAGES+=" asciinema"
PACKAGES+=" kubectl"
PACKAGES+=" sublime-text"
PACKAGES+=" heroku"
PACKAGES+=" android-studio"
for pkg in $PACKAGES; do
  if ! [ -x "$(command -v $pkg)" ]; then
    sudo snap install $pkg --classic
  fi
done

# install "normal" snap packages I use
PACKAGES=""
PACKAGES+=" http"
PACKAGES+=" jq"
PACKAGES+=" robomongo"
PACKAGES+=" gimp"
PACKAGES+=" inkscape"
PACKAGES+=" libreoffice"
PACKAGES+=" vlc"
PACKAGES+=" obs-studio"
PACKAGES+=" simplescreenrecorder"
PACKAGES+=" ngrok"
PACKAGES+=" chromium"
PACKAGES+=" spotify"
PACKAGES+=" orion-desktop" # Powerful BitTorrent client and torrent streamer for Linux Desktop
for pkg in $PACKAGES; do
  if ! [ -x "$(command -v $pkg)" ]; then
    sudo snap install $pkg
  fi
done


# refresh already installed snaps
sudo snap refresh
