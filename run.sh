#!/bin/bash

set -e # exit if any command fails

./apt.sh
./nvm.sh
./dotfiles.sh
./vim.sh
./bin.sh
