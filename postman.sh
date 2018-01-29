#!/bin/bash

npm install -g postman-updater-linux

if [ -d ~/.Postman ];
then
  if postman-updater check -l ~/.Postman | grep 'available'; then
   postman-updater update -l ~/.Postman
 fi
else
  mkdir ~/.Postman
  postman-updater install -l ~/.Postman
fi

if [ -e ~/bin/postman ]
then
  rm ~/bin/postman
fi

if [ -e  ~/.local/share/applications/postman.desktop ]
then
  rm ~/.local/share/applications/postman.desktop
fi

ln -s ~/.Postman/Postman ~/bin/postman
cp postman.desktop ~/.local/share/applications/postman.desktop
