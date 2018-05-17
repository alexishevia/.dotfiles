#!/bin/bash

set -e # exit if any command fails

./apt.sh
./bin.sh
./encrypted.sh restore
./nvm.sh
./dotfiles.sh
./vim.sh
./git.sh
