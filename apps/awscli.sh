#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v aws)" ]; then
  wget -O /tmp/awscli.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
  unzip /tmp/awscli.zip -d /tmp/awscli
  sudo /tmp/awscli/aws/install
fi
