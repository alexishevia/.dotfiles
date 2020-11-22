#!/bin/bash

set -e # exit if any command fails

# symlink all sensitive files

filepaths=".npmrc
.okta-aws
.cpe-cli.json
Projects/FOX/.aws_keys
Projects/Personales/mdo.jks
go/src/github.com/foxbroadcasting/cpe-liveplayer/config/mock.json
go/src/github.com/foxbroadcasting/cpe-lp-listings/config/mock.json
go/src/github.com/foxbroadcasting/cpe-lp-videos/config/mock.json
go/src/github.com/foxbroadcasting/cpe-lp-url/config/mock.json
go/src/github.com/foxbroadcasting/cpe-asset-info/config/mock.json
go/src/github.com/foxbroadcasting/cpe-psu/config/mock.json
go/src/github.com/foxbroadcasting/cpe-geo-service/config/mock.json
go/src/github.com/foxbroadcasting/cpe-epglistings/config/mock.json
go/src/github.com/foxbroadcasting/cpe-sportsplayer/config/mock.json"

for filepath in $filepaths; do
  abspath="$HOME/$filepath"
  if [ -e $abspath ]
  then
    rm $abspath
  fi
  if [ -L $abspath ]
  then
    rm $abspath
  fi
  ln -s "$HOME/.sensitive/$filepath" $abspath
done
