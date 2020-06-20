#!/bin/bash

set -e # exit if any command fails

# install snap packages I use
PACKAGES="slack skype asciinema kubectl sublime-text heroku android-studio"
for pkg in $PACKAGES; do
  if ! [ -x "$(command -v $pkg)" ]; then
    sudo snap install $pkg --classic
  fi
done

PACKAGES="http jq robomongo gimp inkscape libreoffice vlc obs-studio simplescreenrecorder ngrok chromium spotify"
for pkg in $PACKAGES; do
  if ! [ -x "$(command -v $pkg)" ]; then
    sudo snap install $pkg
  fi
done


# refresh already installed snaps
sudo snap refresh
