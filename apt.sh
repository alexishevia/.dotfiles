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

# virtualbox
if ! [ -x "$(command -v virtualbox)" ]; then
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
  codename=$(lsb_release --codename | cut -f2)
  echo "deb https://download.virtualbox.org/virtualbox/debian ${codename} contrib" | sudo tee /etc/apt/sources.list.d/dropbox.list
fi

# spotify
if ! [ -x "$(command -v spotify)" ]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  echo 'deb http://repository.spotify.com stable non-free' | sudo tee /etc/apt/sources.list.d/spotify.list
fi

# vs code
if ! [ -x "$(command -v code)" ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
  sudo install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
fi

# kdenlive
if ! [ -x "$(command -v kdenlive)" ]; then
  sudo add-apt-repository ppa:kdenlive/kdenlive-stable
fi

# java
if ! [ -x "$(command -v java)" ]; then
  sudo add-apt-repository ppa:linuxuprising/java
fi

# apt update
sudo apt update

# remove apt packages I don't want
sudo apt remove --yes avahi-daemon vim vim-gnome terminator gimp inkscape     \
  openshot openshot-qt vlc postgresql postgresql-10 postgresql-client-common  \
  libreoffice

# install apt packages I use
sudo apt install --yes curl build-essential git git-core gitk ack-grep        \
  ncurses-term xclip unzip libjpeg62 unrar kdenlive                           \
  rbenv tidy exuberant-ctags tmux easytag code                                \
  synapse charles-proxy silversearcher-ag sni-qt:i386 veracrypt               \
  gnupg2 libzmq5 libzmq3-dev screenruler apt-transport-https mono-complete    \
  dkms libgconf-2-4 libxcb-xtest0 ttf-ancient-fonts python-pip python3-pip    \
  docker.io docker-compose gnome-screensaver virtualbox-6.0                   \
  gnome-tweak-tool openvpn network-manager-openvpn-gnome spotify-client       \
  adobe-flashplugin mongodb-clients flameshot vim-gtk                         \
  redis-tools libavahi-compat-libdnssd1 net-tools openssh-server              \
  awscli apt-transport-https ocaml golang-1.10 gpick                          \
  cpu-checker qemu-kvm bridge-utils                                           \
  virt-viewer virt-manager oracle-java12-installer

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes

# add user to the docker group
sudo usermod -aG docker ${USER}
