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


versions='8.9.3 8.9.4'

for version in $versions; do
  nvm install $version
  nvm use $version
  npm install -g npm yarn lerna timezones-cli ppp-cli json eslint eslint-config-airbnb commitizen eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-import flow-bin @foxdcg/is-commit-deployed @foxdcg/reindex-mpx-item @mprokopowicz/sqs-monitor
done

nvm alias default 8.9.4
nvm use 8.9.4
