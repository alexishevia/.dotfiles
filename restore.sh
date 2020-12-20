#!/bin/bash

set -e # exit if any command fails

./dotfiles.sh
./apt.sh
./apps/dropbox.sh
./encrypted.sh restore
./sensitive.sh
./bins.sh
./apps/awscli.sh
./nvm.sh
./python.sh
./apps/golang.sh
./neovim.sh
./vim.sh
./git.sh
./sensitive.sh
./hosts.sh
./redis.sh
./work/work.sh
./apps/kubectl.sh
./apps/civo.sh
