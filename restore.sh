#!/bin/bash

set -e # exit if any command fails

./dotfiles.sh
./apt.sh
./snap.sh
./apps/dropbox.sh
./encrypted.sh restore
./apps/golang.sh
./bins.sh
./apps/google-chrome.sh
# ./apps/prey.sh # Current prey version depends on python-gtk2, which is not installable on Ubuntu 20.04
./apps/fiddler.sh
./apps/openshot.sh
./apps/peek.sh
./apps/postman.sh
./apps/zoom.sh
./apps/expressvpn.sh
./apps/minikube.sh
./nvm.sh
./apps/swagger.sh
./apps/react-native-debugger.sh
./python.sh
./vim.sh
./git.sh
./hosts.sh
./apps/vscode/vscode.sh

# restore dconf settings
dconf load /org/ < ./dconf.backup
