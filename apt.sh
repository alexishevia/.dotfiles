#!/bin/bash

# apt update
sudo apt update

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep ncurses-term xclip dconf-tools unzip libjpeg62 libwebkitgtk-1.0-0 unrar compizconfig-settings-manager s3cmd compiz-plugins sni-qt:i386 gcolor2 screenruler vim-gtk android-tools-adb android-tools-fastboot tmux rbenv tidy exuberant-ctags synapse httpie jq

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator

# apt cleanup
sudo apt autoclean --yes
sudo apt autoremove --yes


