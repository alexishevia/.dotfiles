#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v go)" ]; then
  echo "installing go1.14.15"
  wget -O /tmp/golang.tar.gz https://golang.org/dl/go1.14.15.linux-amd64.tar.gz
  sudo tar -xzf /tmp/golang.tar.gz -C /usr/local
  mkdir -p $HOME/go/bin
fi

if ! [ -x "$(command -v dlv)" ]; then
  echo "installing dlv"
  go get github.com/go-delve/delve/cmd/dlv
  pushd $HOME/go/src/github.com/go-delve/delve
  go install github.com/go-delve/delve/cmd/dlv
  popd;
fi

if ! [ -x "$(command -v goimports)" ]; then
  echo "installing goimports"
  go get golang.org/x/tools/cmd/goimports
fi

if ! [ -x "$(command -v consul-template-mock)" ]; then
  echo "installing consul-template-mock"
  go get github.com/nlewo/consul-template-mock && go install github.com/nlewo/consul-template-mock
fi

if ! [ -x "$(command -v golint)" ]; then
  echo "installing golint"
  go get golang.org/x/lint/golint && go install golang.org/x/lint/golint
fi
