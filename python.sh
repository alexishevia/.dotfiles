#!/bin/bash

set -e # exit if any command fails

# install pipenv
pip3 install pipenv

# install okta-awscli
pip3 install --user okta-awscli

# install yq
pip3 install yq

# intall youtube_dl
pip3 install --upgrade youtube_dl
