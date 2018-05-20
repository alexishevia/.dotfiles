#!/bin/bash

set -e # exit if any command fails

source ./constants.sh

# clone repos I use
for repo in $REPOS; do
  IFS='?' read -a arr <<< $repo
  dir="${arr[0]}"
  url="${arr[1]}"

  if [ ! -d $dir ]; then
    git clone $url $dir
  fi
done
