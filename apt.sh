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
  snapd                   ` # Daemon and tooling that enable snap packages                                       ` \
  flatpak                 ` # Application deployment framework for desktop apps                                  ` \
  curl                    ` # command line tool for transferring data with URL syntax                            ` \
  vim-gtk3                ` # Vi IMproved - enhanced vi editor - with GTK3 GUI                                   ` \
  neovim                  ` # heavily refactored vim fork                                                        ` \
  tmux                    ` # terminal multiplexer                                                               ` \
  git git-core            ` # fast, scalable, distributed revision control system                                ` \
  gitk                    ` # revision tree visualizer for git                                                   ` \
  grc                     ` # colouriser for beautifying your logfiles or output of commands                     ` \
  rbenv                   ` # simple per-user Ruby version manager                                               ` \
  silversearcher-ag       ` # very fast grep-like program, alternative to ack-grep                               ` \
  veracrypt               ` # Cross-platform on-the-fly encryption                                               ` \
  docker.io               ` # Linux container runtime                                                            ` \
  docker-compose          ` # Punctual, lightweight development environments using Docker                        ` \
  mongodb-clients         ` # object/document-oriented database (client apps)                                    ` \
  unzip                   ` # De-archiver for .zip files                                                         ` \
  unrar                   ` # Unarchiver for .rar files (non-free version)                                       ` \
  p7zip-full              ` # 7z and 7za file archivers with high compression ratio                              ` \
  oracle-java14-installer ` # Oracle Java(TM) Development Kit (JDK) 14                                           ` \
  python3-pip             ` # Python package installer                                                           ` \
  gnupg2                  ` # GNU privacy guard - I use it to sign git commits                                   ` \
  libusb-1.0-0-dev        ` # userspace USB programming library development files. Required for okta-awscli[U2F] ` \
  nautilus                ` # file manager and graphical shell for GNOME                                         `

# apt cleanup
sudo apt upgrade --yes
sudo apt autoclean --yes
sudo apt autoremove --yes

# add user to the docker group
sudo usermod -aG docker ${USER}
