#!/bin/bash

set -e # exit if any command fails

# install pipenv
pip3 install pipenv

# install okta-awscli
pip3 install --user okta-awscli[U2F]

# install yq
pip3 install yq
