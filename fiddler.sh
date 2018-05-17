#!/usr/bin/env bash

set -e # exit if any command fails


if [ ! -d ~/.fiddler ]; then
  curl -o /tmp/fiddler-linux.zip http://telerik-fiddler.s3.amazonaws.com/fiddler/fiddler-linux.zip
  unzip /tmp/fiddler-linux.zip -d ~/.fiddler
fi

if [ -e  ~/.local/share/applications/fiddler.desktop ]; then
  rm ~/.local/share/applications/fiddler.desktop
fi

cp fiddler.desktop ~/.local/share/applications/fiddler.desktop
