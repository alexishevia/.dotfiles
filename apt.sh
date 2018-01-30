#!/bin/bash

set -e # exit if any command fails

# f.lux
sudo add-apt-repository --yes ppa:nathan-renniewaldock/flux

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# skype
echo 'deb [arch=amd64] https://repo.skype.com/deb stable main' | sudo tee /etc/apt/sources.list.d/skype-stable.list

# charles proxy
wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | sudo tee /etc/apt/sources.list.d/charles.list

# apt update
sudo apt update

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep ncurses-term xclip dconf-tools unzip libjpeg62 libwebkitgtk-1.0-0 unrar compizconfig-settings-manager s3cmd compiz-plugins sni-qt:i386 gcolor2 screenruler vim-gtk android-tools-adb android-tools-fastboot tmux rbenv tidy exuberant-ctags synapse httpie jq fluxgui google-chrome-stable charles-proxy skypeforlinux

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator

# apt cleanup
sudo apt autoclean --yes
sudo apt autoremove --yes
