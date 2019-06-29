#!/bin/bash

set -e # exit if any command fails

./dotfiles.sh
./apt.sh
./snap.sh
./vim.sh
./bins.sh
./apps/dropbox.sh
./apps/prey.sh
./apps/fiddler.sh
./apps/openshot.sh
./apps/peek.sh
./apps/postman.sh
./apps/zoom.sh
./apps/expressvpn.sh
./apps/minikube.sh
./apps/synergy.sh
./apps/swagger.sh
./apps/sp.sh
./python.sh
./encrypted.sh restore
./nvm.sh
./git.sh

# restore dconf settings
dconf load /org/ < ./dconf.backup
