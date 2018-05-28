#!/bin/bash

set -e # exit if any command fails

# vim
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C927EBE00F1B0520
sudo add-apt-repository --yes ppa:jonathonf/vim

# veracrypt
sudo add-apt-repository --yes ppa:unit193/encryption

# git
sudo add-apt-repository --yes ppa:git-core/ppa

# charles proxy
wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | sudo tee /etc/apt/sources.list.d/charles.list

# albert
wget -nv -O /tmp/Release.key https://build.opensuse.org/projects/home:manuelschneid3r/public_key
sudo apt-key add - < /tmp/Release.key
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
codename=$(lsb_release --codename | cut -f2)
echo "deb https://download.virtualbox.org/virtualbox/debian ${codename} contrib" | sudo tee /etc/apt/sources.list.d/dropbox.list

# apt update
sudo apt update

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep        \
  ncurses-term xclip dconf-tools unzip libjpeg62 libwebkitgtk-1.0-0 unrar     \
  vim-gtk android-tools-adb android-tools-fastboot rbenv tidy exuberant-ctags \
  synapse charles-proxy silversearcher-ag sni-qt:i386 veracrypt               \
  gnupg2 libzmq5 libzmq3-dev screenruler apt-transport-https mono-complete    \
  dkms libgconf-2-4 libxcb-xtest0 ttf-ancient-fonts python-pip python3-pip    \
  docker.io docker-compose gnome-screensaver albert virtualbox-5.2            \
  gnome-tweak-tool openvpn network-manager-openvpn-gnome

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator gimp inkscape     \
  openshot openshot-qt vlc postgresql postgresql-10 postgresql-client-common  \
  libreoffice

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes

# add user to the docker group
sudo usermod -aG docker ${USER}
