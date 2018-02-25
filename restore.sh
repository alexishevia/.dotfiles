#!/bin/bash

set -e # exit if any command fails

./apt.sh
./encrypted.sh restore
./nvm.sh
./dotfiles.sh
./vim.sh
./bin.sh
./git.sh
