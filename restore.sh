#!/bin/bash

set -e # exit if any command fails

./dotfiles.sh
./apt.sh
./apps/dropbox.sh
./encrypted.sh restore
./bins.sh
./apps/awscli.sh
./apps/vscode.sh
./nvm.sh
./python.sh
./apps/golang.sh
./neovim.sh
./vim.sh
./git.sh
./hosts.sh
./work/work.sh
