#!/bin/bash

set -e # exit if any command fails

# vim
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C927EBE00F1B0520
sudo add-apt-repository --yes ppa:jonathonf/vim

# f.lux
sudo add-apt-repository --yes ppa:nathan-renniewaldock/flux

# veracrypt
sudo add-apt-repository --yes ppa:unit193/encryption

# go lang
sudo add-apt-repository --yes ppa:gophers/archive

# git
sudo add-apt-repository --yes ppa:git-core/ppa

# heroku
sudo add-apt-repository --yes "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -

# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# charles proxy
wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | sudo tee /etc/apt/sources.list.d/charles.list

# apt update
sudo apt update

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep ncurses-term xclip dconf-tools unzip libjpeg62 libwebkitgtk-1.0-0 unrar compizconfig-settings-manager s3cmd compiz-plugins sni-qt:i386 pick screenruler vim-gtk android-tools-adb android-tools-fastboot rbenv tidy exuberant-ctags synapse fluxgui google-chrome-stable charles-proxy silversearcher-ag veracrypt openshot golang-1.10-go gnupg2 libzmq5 libzmq3-dev apt-transport-https sublime-text heroku mono-complete openshot dkms libxcb-xtest0 ttf-ancient-fonts

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator

# install snap packages I use
sudo snap install slack --classic
sudo snap install tmux --classic
sudo snap install skype --classic
sudo snap install asciinema --classic
sudo snap install spotify http jq robomongo
sudo snap install kubectl --classic

# refresh already installed snaps
sudo snap refresh

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes
