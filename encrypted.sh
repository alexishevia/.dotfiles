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
  veracrypt -t --create /tmp/backup.tc --size=300K --volume-type=normal \
    --encryption=AES --hash=sha-512 --filesystem=FAT --pim=0;

  # create tmp mount directory
  mkdir /tmp/backupmountdir

  # mount veracrypt volume
  veracrypt -t /tmp/backup.tc /tmp/backupmountdir --pim=0 --protect-hidden=no

  # copy ssh directory into veracrypt volume as a tar.gz file
  pushd ~;
  tar -zcvf /tmp/backupmountdir/sshbackup.tar.gz .ssh;
  popd;

  # copy sensitive files into veracrypt volume
  cp ~/.npmrc /tmp/backupmountdir/.npmrc
  cp ~/.nordvpnpass /tmp/backupmountdir/.nordvpnpass
  cp ~/.fox.ovpn /tmp/backupmountdir/.fox.ovpn

  # unmount all veracrypt volumes
  veracrypt -t -d

  # move veracrypt volume to Dropbox
  mv /tmp/backup.tc ~/Dropbox/backup.tc

  # remove tmp mount directory
  rm -r /tmp/backupmountdir
fi

if [ $1 = 'restore' ]
then
  # wait until ssh backup exists
  while [ ! -f ~/Dropbox/backup.tc ]
  do
    echo -n 'Waiting for ~/Dropbox/backup.tc to be ready'
    echo -n '.'; sleep 1;
    echo -n '.'; sleep 1;
    echo -n '.'; sleep 1;
    echo -en "\b\b\b   \b\b\b"; sleep 1;
  done

  # create tmp mount directory
  mkdir /tmp/backupmountdir

  # mount veracrypt volume
  veracrypt -t ~/Dropbox/backup.tc /tmp/backupmountdir --pim=0 --protect-hidden=no

  # extract tar into .ssh
  pushd ~;
  tar -zxvf /tmp/backupmountdir/sshbackup.tar.gz
  popd;

  # copy sensitive files to their correct location
  cp /tmp/backupmountdir/.npmrc ~/.npmrc
  cp /tmp/backupmountdir/.nordvpnpass ~/.nordvpnpass
  cp /tmp/backupmountdir/.fox.ovpn ~/.fox.ovpn

  # unmount all veracrypt volumes
  veracrypt -t -d

  # remove tmp mount directory
  rm -r /tmp/backupmountdir
fi
