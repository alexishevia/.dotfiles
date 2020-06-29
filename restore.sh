#!/bin/bash

set -e # exit if any command fails

./dotfiles.sh
./apt.sh
./snap.sh
./flatpak.sh
./encrypted.sh restore
./apps/golang.sh
./bins.sh
./apps/google-chrome.sh
# ./apps/prey.sh # Current prey version depends on python-gtk2, which is not installable on Ubuntu 20.04
./apps/expressvpn.sh
./nvm.sh
./apps/react-native-debugger.sh
./python.sh
./neovim.sh
./vim.sh
./git.sh
./hosts.sh
./xkb.sh
./apps/vscode/vscode.sh
./fonts.sh
./gnome-extensions.sh

# restore dconf settings
dconf load /org/ < ./dconf.backup
