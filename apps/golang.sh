#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v go)" ]; then
  echo "installing go1.12.3"
  wget -O /tmp/golang.tar.gz https://golang.org/dl/go1.12.3.linux-amd64.tar.gz
  sudo tar -xzf /tmp/golang.tar.gz -C /usr/local
  mkdir -p $HOME/go/bin
fi

if ! [ -x "$(command -v go1.14.3)" ]; then
  echo "installing go1.14.3"
  go get golang.org/dl/go1.14.3
  go1.14.3 download
fi

if ! [ -x "$(command -v dlv)" ]; then
  echo "installing dlv"
  go get github.com/go-delve/delve/cmd/dlv
  pushd $HOME/go/src/github.com/go-delve/delve
  git checkout v1.3.2 # install a glide version compatible with our golang version
  go install github.com/go-delve/delve/cmd/dlv
  popd;
fi

if ! [ -x "$(command -v goimports)" ]; then
  echo "installing goimports"
  go get golang.org/x/tools/cmd/goimports
fi

if ! [ -x "$(command -v glide)" ]; then
  echo "installing glide"
  curl https://glide.sh/get | sh
fi

if ! [ -x "$(command -v cpe-cli)" ]; then
  echo "installing cpe-cli"
  go get github.com/foxbroadcasting/cpe-cli && go install github.com/foxbroadcasting/cpe-cli
fi

if ! [ -x "$(command -v go-template-mock)" ]; then
  echo "installing go-template-mock"
  go get github.com/nlewo/consul-template-mock && go install github.com/nlewo/consul-template-mock
fi

if ! [ -x "$(command -v golint)" ]; then
  echo "installing golint"
  go get golang.org/x/lint/golint && go install golang.org/x/lint/golint
fi
