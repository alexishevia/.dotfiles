#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v go)" ]; then
  wget -O /tmp/golang.tar.gz https://dl.google.com/go/go1.12.3.linux-amd64.tar.gz
  sudo tar -xzf /tmp/golang.tar.gz -C /usr/local
  mkdir -p $HOME/go/bin
fi

if ! [ -x "$(command -v glide)" ]; then
  curl https://glide.sh/get | sh
fi

if ! [ -x "$(command -v cpe-cli)" ]; then
  go get github.com/foxbroadcasting/cpe-cli && go install github.com/foxbroadcasting/cpe-cli
fi

if ! [ -x "$(command -v go-template-mock)" ]; then
  go get github.com/nlewo/consul-template-mock && go install github.com/nlewo/consul-template-mock
fi
