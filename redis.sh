#!/bin/bash

set -e # exit if any command fails

if [ -e /etc/redis/redis.conf ]
then
  sudo rm /etc/redis/redis.conf
fi
sudo ln -i "$PWD/redis.conf" /etc/redis/redis.conf
