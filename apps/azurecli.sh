#!/usr/bin/env bash
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

set -e # exit if any command fails

if ! [ -x "$(command -v az)" ]; then
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi
