#!/bin/bash

set -e # exit if any command fails

# veracrypt
if ! [ -x "$(command -v veracrypt)" ]; then
  sudo add-apt-repository --yes ppa:unit193/encryption
fi

# git
if ! [ -x "$(command -v git)" ]; then
  sudo add-apt-repository --yes ppa:git-core/ppa
fi

# charles proxy
if ! [ -x "$(command -v charles)" ]; then
  wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
  echo 'deb https://www.charlesproxy.com/packages/apt/ charles-proxy main' | sudo tee /etc/apt/sources.list.d/charles.list
fi

# vs code
if ! [ -x "$(command -v code)" ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
  sudo install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
fi

# java
if ! [ -x "$(command -v java)" ]; then
  sudo add-apt-repository --yes ppa:linuxuprising/java
fi

# yubikey manager
# sudo add-apt-repository --yes ppa:yubico/stable

# apt update
sudo apt update

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator gimp inkscape     \
  openshot openshot-qt vlc libreoffice

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep        \
  ncurses-term xclip unzip libjpeg62 unrar ttf-ancient-fonts gparted          \
  rbenv tidy exuberant-ctags tmux easytag code libgl1-mesa-glx                \
  synapse charles-proxy silversearcher-ag veracrypt                           \
  gnupg2 libzmq5 libzmq3-dev screenruler apt-transport-https mono-complete    \
  dkms libgconf-2-4 libxcb-xtest0 python-pip python3-pip python-gtk2          \
  docker.io docker-compose gnome-screensaver                                  \
  gnome-tweak-tool openvpn network-manager-openvpn-gnome                      \
  mongodb-clients flameshot vim-gtk yubikey-manager-qt                        \
  redis-tools libavahi-compat-libdnssd1 net-tools openssh-server              \
  awscli apt-transport-https ocaml gpick                                      \
  cpu-checker qemu-kvm bridge-utils scrot streamer mpg123 simple-scan         \
  virt-viewer virt-manager oracle-java13-installer virtualbox lmms

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes

# add user to the docker group
sudo usermod -aG docker ${USER}
