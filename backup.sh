#!/bin/bash

set -e # exit if any command fails

# make sure repos have no pending changes
repos="$HOME/.dotfiles?git@github.com:alexishevia/.dotfiles.git
$HOME/knowledge?git@bitbucket.org:alexishevia/knowledge.git
$HOME/jupyter_notebooks?git@github.com:alexishevia/jupyter_notebooks.git
$HOME/Projects/FOX/dcgapi-services?git@github.com:foxbroadcasting/dcgapi-services.git
$HOME/Projects/FOX/fng-cms?git@github.com:foxbroadcasting/fng-cms.git
$HOME/Projects/FOX/splunk_dashboards?git@github.com:foxbroadcasting/splunk_dashboards.git
$HOME/Projects/Personales/personal_finance?git@bitbucket.org:alexishevia/personal_finance.git"
for repo in $repos; do
  IFS='?' read -a arr <<< $repo
  dir="${arr[0]}"

  pushd $dir
  if [[ `git status --porcelain` ]]; then
    echo "ERROR: git repo $dir has pending changes"
    exit 1;
  fi
  popd;
done

# backup confidential directories
./encrypted.sh backup
