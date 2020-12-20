#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v minikube)" ]; then
  wget -O /tmp/kubectl  "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x /tmp/kubectl
  sudo mv /tmp/kubectl /usr/local/bin/kubectl
fi
