#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v google-chrome)" ]; then
  wget -O /tmp/google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  sudo dpkg -i /tmp/google-chrome.deb
fi
