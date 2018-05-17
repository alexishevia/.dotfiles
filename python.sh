#!/bin/bash

set -e # exit if any command fails

# install virtualenvwrapper
sudo pip install virtualenvwrapper

if ! [ -d ~/.virtualenvs ]; then
  mkdir ~/.virtualenvs
fi
