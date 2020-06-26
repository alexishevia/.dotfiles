#!/bin/bash

set -e # exit if any command fails

# OpenShot Video Editor - An easy to use, quick to learn, and surprisingly powerful video editor
flatpak install -y flathub org.openshot.OpenShot

# Peek - Simple screen recorder with an easy to use interface
flatpak install -y flathub com.uploadedlobster.peek

# Postman - Postman is a complete API development environment.
flatpak install -y flathub com.getpostman.Postman

# Zoom - Video Conferencing, Web Conferencing, Webinars, Screen Sharing
flatpak install -y flathub us.zoom.Zoom

# Audacity - Record and edit audio files
flatpak install -y flathub org.audacityteam.Audacity

# update all installed applications
flatpak update
