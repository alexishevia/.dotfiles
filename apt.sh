#!/bin/bash

set -e # exit if any command fails

# vim
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C927EBE00F1B0520
sudo add-apt-repository --yes ppa:jonathonf/vim

# veracrypt
sudo add-apt-repository --yes ppa:unit193/encryption

# go lang
sudo add-apt-repository --yes ppa:gophers/archive

# git
sudo add-apt-repository --yes ppa:git-core/ppa

# heroku
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
echo "deb https://cli-assets.heroku.com/branches/stable/apt ./" | sudo tee /etc/apt/sources.list.d/heroku-cli.list

# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# charles proxy
wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | sudo tee /etc/apt/sources.list.d/charles.list

# albert
wget -nv -O /tmp/Release.key https://build.opensuse.org/projects/home:manuelschneid3r/public_key
sudo apt-key add - < /tmp/Release.key
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list

# apt update
sudo apt update

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep        \
  ncurses-term xclip dconf-tools unzip libjpeg62 libwebkitgtk-1.0-0 unrar     \
  vim-gtk android-tools-adb android-tools-fastboot rbenv tidy exuberant-ctags \
  synapse google-chrome-stable charles-proxy silversearcher-ag sni-qt:i386    \
  veracrypt openshot golang-1.10-go gnupg2 libzmq5 libzmq3-dev screenruler    \
  apt-transport-https sublime-text heroku mono-complete openshot dkms         \
  libxcb-xtest0 ttf-ancient-fonts python-pip gnome-tweak-tool albert          \
  docker.io docker-compose gnome-screensaver openvpn vlc postgresql-10        \
  libgconf-2-4 network-manager-openvpn-gnome

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator gimp inkscape     \
  libreoffice

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes

# add user to the docker group
sudo usermod -aG docker ${USER}
