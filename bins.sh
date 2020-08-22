#!/bin/bash

set -e # exit if any command fails

if [ -d ~/bin ]; then
  rm -r ~/bin
fi
cp -r ./home_bins ~/bin
