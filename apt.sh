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

# java
if ! [ -x "$(command -v java)" ]; then
  sudo add-apt-repository --yes ppa:linuxuprising/java
fi

# apt update
sudo apt update

# remove apt packages I don't want
# Most of these will be installed from a different source - either a different
# apt package, snap or flatpack
sudo apt remove --yes vim vim-gnome terminator gimp inkscape     \
  openshot openshot-qt vlc libreoffice

# install apt packages I use
sudo apt install --yes \
  snapd                   ` # Daemon and tooling that enable snap packages                   ` \
  flatpak                 ` # Application deployment framework for desktop apps              ` \
  curl                    ` # command line tool for transferring data with URL syntax        ` \
  vim-gtk3                ` # Vi IMproved - enhanced vi editor - with GTK3 GUI               ` \
  neovim                  ` # heavily refactored vim fork                                    ` \
  tmux                    ` # terminal multiplexer                                           ` \
  git git-core            ` # fast, scalable, distributed revision control system            ` \
  gitk                    ` # revision tree visualizer for git                               ` \
  code                    ` # vs code                                                        ` \
  grc                     ` # colouriser for beautifying your logfiles or output of commands ` \
  gparted                 ` # GNOME partition editor                                         ` \
  rbenv                   ` # simple per-user Ruby version manager                           ` \
  charles-proxy           ` # proxy for web debugging                                        ` \
  silversearcher-ag       ` # very fast grep-like program, alternative to ack-grep           ` \
  veracrypt               ` # Cross-platform on-the-fly encryption                           ` \
  screenruler             ` # measure objects on screen with a variety of metrics            ` \
  docker.io               ` # Linux container runtime                                        ` \
  docker-compose          ` # Punctual, lightweight development environments using Docker    ` \
  mongodb-clients         ` # object/document-oriented database (client apps)                ` \
  flameshot               ` # Powerful yet simple-to-use screenshot software                 ` \
  redis-server            ` # Persistent key-value database with network interface           ` \
  redis-tools             ` # Persistent key-value database with network interface (client)  ` \
  gpick                   ` # advanced GTK+ color picker                                     ` \
  unzip                   ` # De-archiver for .zip files                                     ` \
  unrar                   ` # Unarchiver for .rar files (non-free version)                   ` \
  p7zip-full              ` # 7z and 7za file archivers with high compression ratio          ` \
  simple-scan             ` # Simple Scanning Utility                                        ` \
  nautilus-dropbox        ` # Dropbox integration for Nautilus                               ` \
  oracle-java14-installer ` # Oracle Java(TM) Development Kit (JDK) 14                       ` \
  virtualbox              ` # x86 virtualization solution - base binaries                    ` \
  python3-pip             ` # Python package installer                                       ` \
  gnupg2                  ` # GNU privacy guard - I use it to sign git commits               ` \
  pavucontrol             ` # PulseAudio Volume Control                                      `

# install dropbox daemon and start it
dropbox start -i

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes

# add user to the docker group
sudo usermod -aG docker ${USER}
