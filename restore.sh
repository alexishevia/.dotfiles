#!/bin/bash

set -e # exit if any command fails

./dotfiles.sh
./apt.sh
./snap.sh
./vim.sh
./bin.sh
./dropbox.sh
./fiddler.sh
./zoom.sh
./encrypted.sh restore
./nvm.sh
./git.sh
./postman.sh
./python.sh
