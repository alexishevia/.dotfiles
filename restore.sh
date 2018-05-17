#!/bin/bash

set -e # exit if any command fails

./apt.sh
./dotfiles.sh
./vim.sh
./bin.sh
./dropbox.sh
./fiddler.sh
./zoom.sh
./encrypted.sh restore
./nvm.sh
./git.sh
./postman.sh
