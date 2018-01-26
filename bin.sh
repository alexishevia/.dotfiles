#!/bin/bash

if [ -d ~/bin ]
then
  sudo rm -r ~/bin
fi
cp -r bin ~/bin

./robomongo.sh
./postman.sh
