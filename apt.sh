#!/bin/bash

set -e # exit if any command fails

# veracrypt
sudo add-apt-repository --yes ppa:unit193/encryption

# git
sudo add-apt-repository --yes ppa:git-core/ppa

# sound-switcher
sudo apt-add-repository --yes ppa:yktooo/ppa

# charles proxy
wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | sudo tee /etc/apt/sources.list.d/charles.list

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
codename=$(lsb_release --codename | cut -f2)
echo "deb https://download.virtualbox.org/virtualbox/debian ${codename} contrib" | sudo tee /etc/apt/sources.list.d/dropbox.list

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# apt update
sudo apt update

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator gimp inkscape     \
  openshot openshot-qt vlc postgresql postgresql-10 postgresql-client-common  \
  libreoffice

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep        \
  ncurses-term xclip dconf-tools unzip libjpeg62 libwebkitgtk-1.0-0 unrar     \
  android-tools-adb android-tools-fastboot rbenv tidy exuberant-ctags         \
  synapse charles-proxy silversearcher-ag sni-qt:i386 veracrypt               \
  gnupg2 libzmq5 libzmq3-dev screenruler apt-transport-https mono-complete    \
  dkms libgconf-2-4 libxcb-xtest0 ttf-ancient-fonts python-pip python3-pip    \
  docker.io docker-compose gnome-screensaver virtualbox-5.2 mdbus2            \
  gnome-tweak-tool openvpn network-manager-openvpn-gnome spotify-client       \
  adobe-flashplugin mongodb-clients flameshot chromium-browser vim-gtk        \
  redis-tools libavahi-compat-libdnssd1 net-tools openssh-server              \
  indicator-sound-switcher

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes

# add user to the docker group
sudo usermod -aG docker ${USER}
