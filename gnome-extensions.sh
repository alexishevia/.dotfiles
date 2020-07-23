#!/usr/bin/env bash

set -e # exit if any command fails

# dash to dock
# https://extensions.gnome.org/extension/307/dash-to-dock/
mkdir -p "$HOME/.local/share/gnome-shell/extensions"
wget -O /tmp/dashtodock.zip https://extensions.gnome.org/download-extension/dash-to-dock%40micxgx.gmail.com.shell-extension.zip?version_tag=15925
unzip /tmp/dashtodock.zip -d "$HOME/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com"
gnome-extensions enable dash-to-dock@micxgx.gmail.com

# Shade Inactive Windows
# https://extensions.gnome.org/extension/650/shade-inactive-windows/
wget -O /tmp/shadeinactive.zip https://extensions.gnome.org/download-extension/shade-inactive-windows%40hepaajan.iki.fi.shell-extension.zip?version_tag=4168
unzip /tmp/shadeinactive.zip -d "$HOME/.local/share/gnome-shell/extensions/shade-inactive-windows@hepaajan.iki.fi"
gnome-extensions enable shade-inactive-windows@hepaajan.iki.fi

# Remove Alt+Tab Delay
# https://extensions.gnome.org/extension/1403/remove-alttab-delay/
wget -O /tmp/remove-alt-tab-delay.zip https://extensions.gnome.org/download-extension/remove-alt-tab-delay%40tetrafox.pw.shell-extension.zip?version_tag=8000
unzip /tmp/remove-alt-tab-delay.zip -d "$HOME/.local/share/gnome-shell/extensions/remove-alt-tab-delay@tetrafox.pw"
gnome-extensions enable remove-alt-tab-delay@tetrafox.pw

# restart gnome
sudo /etc/init.d/gdm3 restart
