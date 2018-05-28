#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v minikube)" ]; then
  repo='kubernetes/minikube'
  latest=$(curl --silent "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
  number=$(echo $latest | cut -c 2- | sed 's/\.\([0-9]\)$/-\1/g')
  wget -O /tmp/minikube.deb "https://github.com/kubernetes/minikube/releases/download/${latest}/minikube_${number}.deb"
  sudo dpkg -i /tmp/minikube.deb
fi
