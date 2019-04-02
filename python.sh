#!/bin/bash

set -e # exit if any command fails

# install neovim python client
pip2 install neovim
pip3 install neovim

# install pipenv
pip2 install pipenv

# install okta-awscli
pip2 install --user git+https://github.com/foxbroadcasting/okta-awscli.git
