#!/bin/bash

if ! [ -d ~/.robo3t-1.1.1-linux-x86_64-c93c6b0 ];
then
  wget https://download.robomongo.org/1.1.1/linux/robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
  tar -xvzf robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
  mv robo3t-1.1.1-linux-x86_64-c93c6b0 ~/.robo3t-1.1.1-linux-x86_64-c93c6b0
  rm robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz

  # fix for https://github.com/Studio3T/robomongo/issues/1385
  rm ~/.robo3t-1.1.1-linux-x86_64-c93c6b0/lib/libstdc++*
fi

if [ -e ~/bin/robomongo ]
then
  rm ~/bin/robomongo
fi

ln -s ~/.robo3t-1.1.1-linux-x86_64-c93c6b0/bin/robo3t ~/bin/robomongo
