#!/bin/bash

set -e # exit if any command fails

# f.lux
sudo add-apt-repository --yes ppa:nathan-renniewaldock/flux

# veracrypt
sudo add-apt-repository --yes ppa:unit193/encryption

# openshot
sudo add-apt-repository --yes ppa:openshot.developers/ppa

# go lang
sudo add-apt-repository --yes ppa:gophers/archive

# git
sudo add-apt-repository --yes ppa:git-core/ppa

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# charles proxy
wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | sudo tee /etc/apt/sources.list.d/charles.list

# dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
echo 'deb http://linux.dropbox.com/ubuntu/ xenial main' | sudo tee /etc/apt/sources.list.d/dropbox.list

# apt update
sudo apt update

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep ncurses-term xclip dconf-tools unzip libjpeg62 libwebkitgtk-1.0-0 unrar compizconfig-settings-manager s3cmd compiz-plugins sni-qt:i386 gcolor2 screenruler vim-gtk android-tools-adb android-tools-fastboot rbenv tidy exuberant-ctags synapse fluxgui google-chrome-stable charles-proxy silversearcher-ag veracrypt dropbox openshot bashdb golang-1.9-go gnupg2

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator

# install snap packages I use
sudo snap install slack --classic
sudo snap install tmux --classic
sudo snap install skype --classic
sudo snap install asciinema --classic
sudo snap install spotify http jq robomongo

# refresh already installed snaps
sudo snap refresh

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes
