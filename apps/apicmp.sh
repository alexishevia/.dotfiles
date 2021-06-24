#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v apicmp)" ]; then
  echo "installing apicmp"
  wget -O /tmp/apicmp 'https://github.com/arithran/apicmp/releases/download/v1.11.0/apicmp-linux'
  chmod +x /tmp/apicmp
  sudo mv /tmp/apicmp /usr/local/bin/apicmp
fi
