#!/bin/bash

set -e # exit if any command fails

# install snap packages I use
sudo snap install slack --classic
sudo snap install skype --classic
sudo snap install asciinema --classic
sudo snap install kubectl --classic
sudo snap install sublime-text --classic
sudo snap install heroku --classic
sudo snap install code --classic # VS Code
sudo snap install android-studio --classic

PACKAGES="http jq robomongo gimp inkscape libreoffice vlc obs-studio simplescreenrecorder ngrok chromium"
for pkg in $PACKAGES; do
  if ! [ -x "$(command -v $pkg)" ]; then
    sudo snap install $pkg
  fi
done


# refresh already installed snaps
sudo snap refresh
