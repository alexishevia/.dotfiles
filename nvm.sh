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


versions='8.14.0 10.15.0'

for version in $versions; do
  nvm install $version
  nvm use $version
  npm install -g npm yarn lerna commitizen typescript flow-bin elasticdump \
    eslint eslint-config-prettier eslint-plugin-require-path-exists \
    timezones-cli ppp-cli json @mdo-org/mdo-cli \
    @foxdcg/reindex-mpx-item @mprokopowicz/sqs-monitor \
    docsify-cli onchange
done

nvm alias default 8.14.0
nvm use 8.14.0
