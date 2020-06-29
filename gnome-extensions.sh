#!/usr/bin/env bash

set -e # exit if any command fails

# dash to dock
# https://extensions.gnome.org/extension/307/dash-to-dock/
mkdir -p "$HOME/.local/share/gnome-shell/extensions"
wget -O /tmp/dashtodock.zip https://extensions.gnome.org/download-extension/dash-to-dock%40micxgx.gmail.com.shell-extension.zip?version_tag=15925
unzip /tmp/dashtodock.zip -d "$HOME/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com"
gnome-extensions enable dash-to-dock@micxgx.gmail.com

# restart gnome
sudo /etc/init.d/gdm3 restart
