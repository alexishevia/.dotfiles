#!/bin/bash

set -e # exit if any command fails

# symlink all sensitive files

filepaths=".npmrc
.aws
.cpe-cli.json
.civo.json
.ssh
.gnupg
.azure/accessTokens.json
Projects/Personales/mdo.jks
Projects/FOX/.aws_keys
Projects/FOX/cpe-watch/config/mock.json
Projects/FOX/cpe-canIplay/config/config.cfg
Projects/FOX/cpe-video-service/config/config.cfg
Projects/FOX/cpe-epglistings/config/config.cfg
Projects/FOX/cpe-lp-url/config/mock.json
Projects/FOX/cpe-liveplayer/config/mock.json
Projects/FOX/cpe-psu/config/mock.json
Projects/FOX/cpe-contentsku/config/mock.json
Projects/FOX/cpe-geo-service/config/mock.json
Projects/FOX/cpe-screens/config/mock.json
Projects/FOX/cpe-asset-info/config/mock.json
Projects/FOX/cpe-sportsplayer/config/mock.json
Projects/FOX/cpe-lp-listings/config/mock.json
go/src/github.com/foxbroadcasting/cpe-lp-videos/config/mock.json"

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
