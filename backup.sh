#!/bin/bash

set -e # exit if any command fails

source ./constants.sh

# make sure repos have no pending changes
for repo in $REPOS; do
  IFS='?' read -a arr <<< $repo
  dir="${arr[0]}"

  pushd $dir
  if [[ `git status --porcelain` ]]; then
    echo "ERROR: git repo $dir has pending changes"
    exit 1;
  fi
  popd;
done

# backup dconf settings
dconf dump /org/ > ./dconf.backup

# backup confidential directories
./encrypted.sh backup
