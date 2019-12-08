#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v minikube)" ]; then
  wget -O /tmp/minikube.deb 'https://storage.googleapis.com/minikube/releases/latest/minikube_1.5.2.deb'
  sudo dpkg -i /tmp/minikube.deb
fi
