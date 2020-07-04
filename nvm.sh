#!/bin/bash

set -e # exit if any command fails

# install nvm
if ! [ -d ~/.nvm ]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm
fi
pushd ~/.nvm
git pull
. ~/.nvm/nvm.sh
popd


versions='12.16.1 v11.9.0'

for version in $versions; do
  nvm install $version
  nvm use $version
  npm install -g npm yarn
  npm install -g eslint eslint-config-prettier eslint-plugin-require-path-exists
  npm install -g timezones-cli # Command line tool to convert a date or timestamp into different timezones.
  npm install -g @mdo-org/mdo-cli # free, open source to-do app built to live inside your editor
  npm install -g docsify-cli # A magical documentation generator
  npm install -g vsce # Visual Studio Code Extension Manager
  npm install -g commitizen # Simple commit conventions for internet citizens.
done

nvm alias default 12.16.1
nvm use 12.16.1
