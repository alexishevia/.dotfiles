#!/bin/bash

set -e # exit if any command fails

mockfiles='cpe-epglistings.json'

for file in $mockfiles; do
  # split value by '.'
  IFS='.' read -a arr <<< $file

  path="$GOPATH/src/github.com/foxbroadcasting/${arr[0]}/config/mock.json"

  if [ -e $path ]
  then
    rm $path
  fi
  if [ -L $path ]
  then
    rm $path
  fi
  ln -s "$PWD/work/configs/$file" $path
done
