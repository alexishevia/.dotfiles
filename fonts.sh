#!/usr/bin/env bash

set -e # exit if any command fails

mkdir -p ~/.local/share/fonts/

# "Input" font - https://input.fontbureau.com/
if ! [ -x "$(command -v fiddler)" ]; then
  wget -O /tmp/font_input.zip 'https://input.fontbureau.com/build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do'
  unzip /tmp/font_input.zip -d /tmp/font_input
  cp /tmp/font_input/Input_Fonts/InputMono/InputMono/InputMono-Regular.ttf ~/.local/share/fonts/
fi

# regenerate font cache
fc-cache -f -v
