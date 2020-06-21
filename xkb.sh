#!/bin/bash

# remap Caps Lock to Home
# https://blog.guilhermegarnier.com/2017/12/increasing-productivity-in-tmux-with-a-single-prefix-key/

set -e # exit if any command fails

if [ -e '/usr/share/X11/xkb/symbols/pc' ]
then
  sudo rm '/usr/share/X11/xkb/symbols/pc'
fi
sudo ln -i "$PWD/xkb_pc" '/usr/share/X11/xkb/symbols/pc'
