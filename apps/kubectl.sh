#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v kubectl)" ]; then
  wget -O /tmp/kubectl  "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x /tmp/kubectl
  sudo mv /tmp/kubectl /usr/local/bin/kubectl

  # enable kubectl autocompletion
  kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl
fi

if ! [ -x "$(command -v kubectx)" ]; then
  wget -O /tmp/kubectx 'https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubectx'
  chmod +x /tmp/kubectx
  sudo mv /tmp/kubectx /usr/local/bin/kubectx

  # enable kubectx autocompletion
  wget -O /tmp/kubectx.bash 'https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubectx.bash'
  sudo mv /tmp/kubectx.bash /etc/bash_completion.d/kubectx
fi

if ! [ -x "$(command -v kubens)" ]; then
  wget -O /tmp/kubens 'https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubens'
  chmod +x /tmp/kubens
  sudo mv /tmp/kubens /usr/local/bin/kubens

  # enable kubens autocompletion
  wget -O /tmp/kubens.bash 'https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubens.bash'
  sudo mv /tmp/kubens.bash /etc/bash_completion.d/kubens
fi
