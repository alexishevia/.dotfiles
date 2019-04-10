#!/usr/bin/env bash

set -e # exit if any command fails

# install swagger-editor
if ! [ -d ~/.swagger-editor]; then
  git clone https://github.com/swagger-api/swagger-editor.git ~/.swagger-editor
fi
pushd ~/.swagger-editor
git pull
npm install
popd
