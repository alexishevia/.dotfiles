#!/bin/bash

set -e # exit if any command fails

sudo rm /etc/hosts
sudo cp ./hosts /etc/hosts
