#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! [ -x "$(command -v k9s)" ]; then
  brew install k9s
fi
