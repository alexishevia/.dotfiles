#!/bin/bash

set -e # exit if any command fails

mockfiles='cpe-asset-info cpe-epglistings cpe-psu cpe-lp-videos cpe-lp-url cpe-liveplayer cpe-lp-listings cpe-geo-service'

for file in $mockfiles; do
  path="$GOPATH/src/github.com/foxbroadcasting/$file/config/mock.json"

  if [ -e $path ]
  then
    rm $path
  fi
  if [ -L $path ]
  then
    rm $path
  fi
  ln -s "$PWD/work/configs/$file.json" $path
done

# canIPlay is a special case because it cannot use mock.json
path="$GOPATH/src/github.com/foxbroadcasting/cpe-canIplay/config/config.cfg"
if [ -e $path ]
then
  rm $path
fi
if [ -L $path ]
then
  rm $path
fi
ln -s "$PWD/work/configs/cpe-canIplay.cfg" $path
