#!/bin/bash

set -e # exit if any command fails

# clone repos I use
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
  url="${arr[1]}"

  if [ ! -d $dir ]; then
    git clone $url $dir
  fi
done
