#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v react-native-debugger)" ]; then
  repo='jhen0409/react-native-debugger'
  latest=$(curl --silent "https://api.github.com/repos/${repo}/releases/latest" | grep 'tag_name' | grep -o "[0-9.]\+")
  wget -O /tmp/rnd.zip "https://github.com/${repo}/releases/download/v${latest}/rn-debugger-linux-x64.zip"
  unzip /tmp/rnd.zip -d "$HOME/.react-native-debugger"
  sudo ln -s $HOME/.react-native-debugger/react-native-debugger /usr/local/bin/react-native-debugger
fi

sudo cp ./apps/react-native.png /usr/share/icons/react-native.png
cat ./apps/react-native-debugger.desktop > $HOME/.local/share/applications/react-native-debugger.desktop
