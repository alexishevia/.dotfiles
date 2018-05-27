#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v fiddler)" ]; then
  wget -O /tmp/fiddler.zip http://telerik-fiddler.s3.amazonaws.com/fiddler/fiddler-linux.zip
  unzip /tmp/fiddler.zip -d "$HOME/.fiddler"
  echo "mono $HOME/.fiddler/Fiddler.exe" | sudo tee /usr/local/bin/fiddler
  sudo chmod +x /usr/local/bin/fiddler
fi

cat apps/fiddler.desktop > ~/.local/share/applications/fiddler.desktop
