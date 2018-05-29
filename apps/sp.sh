#!/bin/bash

set -e # exit if any command fails

if ! [ -x "$(command -v sp)" ]; then
  wget -O /tmp/sp https://gist.githubusercontent.com/wandernauta/6800547/raw/2c2ad0f3849b1b1cd1116b80718d986f1c1e7966/sp
  sudo mv /tmp/sp /usr/local/bin/sp
  sudo chmod +x /usr/local/bin/sp
fi

cat ./apps/spotify_play.desktop > ~/.local/share/applications/spotify_play.desktop
cat ./apps/spotify_pause.desktop > ~/.local/share/applications/spotify_pause.desktop
cat ./apps/spotify_next.desktop > ~/.local/share/applications/spotify_next.desktop
cat ./apps/spotify_previous.desktop > ~/.local/share/applications/spotify_previous.desktop
