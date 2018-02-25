#!/bin/bash

set -e # exit if any command fails

if [ ! $1 ] || ([ $1 != 'backup' ] && [ $1 != 'restore' ])
then
  echo 'Argument must be "backup" or "restore".';
  exit 1;
fi

if [ $1 = 'backup' ]
then
  # create veracrypt volume
  veracrypt -t --create /tmp/sshbackup.tc --size=300K --volume-type=normal \
    --encryption=AES --hash=sha-512 --filesystem=FAT --pim=0;

  # create tmp mount directory
  mkdir /tmp/sshmountdir

  # mount veracrypt volume
  veracrypt -t /tmp/sshbackup.tc /tmp/sshmountdir --pim=0 --protect-hidden=no

  # tar ssh directory into veracrypt volume
  pushd ~;
  tar -zcvf /tmp/sshmountdir/sshbackup.tar.gz .ssh;
  popd;

  # unmount all veracrypt volumes
  veracrypt -t -d

  # move veracrypt volume to Dropbox
  mv /tmp/sshbackup.tc ~/Dropbox/sshbackup.tc

  # remove tmp mount directory
  rm -r /tmp/sshmountdir
fi

if [ $1 = 'restore' ]
then
  # wait until ssh backup exists
  echo -n 'Waiting for ~/Dropbox/sshbackup.tar.gz to be ready'
  while [ ! -f ~/Dropbox/sshbackup.tar.gz ]
  do
    echo -n '.'; sleep 1;
    echo -n '.'; sleep 1;
    echo -n '.'; sleep 1;
    echo -en "\b\b\b   \b\b\b"; sleep 1;
  done

  # create tmp mount directory
  mkdir /tmp/sshmountdir

  # mount veracrypt volume
  veracrypt -t ~/Dropbox/sshbackup.tc /tmp/sshmountdir --pim=0 --protect-hidden=no

  # extract tar into .ssh
  pushd ~;
  tar -zxvf /tmp/sshmountdir/sshbackup.tar.gz
  popd;

  # unmount all veracrypt volumes
  veracrypt -t -d

  # remove tmp mount directory
  rm -r /tmp/sshmountdir
fi
