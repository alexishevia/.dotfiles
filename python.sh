#!/bin/bash

set -e # exit if any command fails

# install neovim python client
pip3 install neovim

# install pipenv
pip3 install pipenv

# install okta-awscli
pip3 install --user okta-awscli

# install yq
pip3 install yq
