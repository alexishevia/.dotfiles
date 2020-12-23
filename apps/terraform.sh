#!/usr/bin/env bash

set -e # exit if any command fails

if ! [ -x "$(command -v terraform)" ]; then
  wget -O /tmp/terraform.zip 'https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip'
  unzip /tmp/terraform.zip -d /tmp/terraform
  sudo mv /tmp/terraform/terraform /usr/local/bin/
fi
