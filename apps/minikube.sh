#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v minikube)" ]; then
  wget -O /tmp/minikube.deb 'https://github.com/kubernetes/minikube/releases/download/v1.9.2/minikube_1.9.2-0_amd64.deb'
  sudo dpkg -i /tmp/minikube.deb
fi
