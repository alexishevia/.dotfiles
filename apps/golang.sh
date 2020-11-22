#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v go)" ]; then
  wget -O /tmp/golang.tar.gz https://golang.org/dl/go1.12.3.linux-amd64.tar.gz
  sudo tar -xzf /tmp/golang.tar.gz -C /usr/local
  mkdir -p $HOME/go/bin
fi

if ! [ -x "$(command -v dlv)" ]; then
  go get github.com/go-delve/delve/cmd/dlv
  pushd $HOME/go/src/github.com/go-delve/delve
  git checkout v1.3.2 # install a glide version compatible with our golang version
  go install github.com/go-delve/delve/cmd/dlv
  popd;
fi

if ! [ -x "$(command -v goimports)" ]; then
  go get golang.org/x/tools/cmd/goimports
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

if ! [ -x "$(command -v golint)" ]; then
  go get golang.org/x/lint/golint && go install golang.org/x/lint/golint
fi
