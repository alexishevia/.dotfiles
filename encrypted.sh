#!/bin/bash

set -e # exit if any command fails

if [ ! $1 ] || ([ $1 != 'backup' ] && [ $1 != 'restore' ])
then
  echo 'Argument must be "backup" or "restore".';
  exit 1;
fi

# When running 'backup', you will be asked:
# 1. The password for the new teracrypt volume to create
# 2. Keyfile - leave the default value of [none]
# 3. Random characters
# 4. The same password as #1
# 5. Keyfile - leave the default value of [none]
# 6. Your linux sudo password
if [ $1 = 'backup' ]
then
  # create veracrypt volume
  veracrypt -t --create /tmp/backup.tc --size=600K --volume-type=normal \
    --encryption=AES --hash=sha-512 --filesystem=FAT --pim=0;

  # create tmp mount directory
  mkdir /tmp/backupmountdir

  # mount veracrypt volume
  veracrypt -t /tmp/backup.tc /tmp/backupmountdir --pim=0 --protect-hidden=no

  # copy ssh directory into veracrypt volume as a tar.gz file
  pushd ~;
  tar -zcvf /tmp/backupmountdir/sshbackup.tar.gz .ssh;
  popd;

  # copy .gnupg directory into veracrypt volume as a tar.gz file
  pushd ~;
  tar -zcvf /tmp/backupmountdir/gnupgbackup.tar.gz .gnupg;
  popd;

  # copy sensitive files into veracrypt volume
  cp ~/.npmrc /tmp/backupmountdir/.npmrc
  cp ~/.fox.ovpn /tmp/backupmountdir/.fox.ovpn
  cp ~/.okta-aws /tmp/backupmountdir/.okta-aws
  cp ~/.cpe-cli.json /tmp/backupmountdir/.cpe-cli.json
  cp ~/Projects/FOX/.aws_keys /tmp/backupmountdir/.fox_aws_keys
  cp ~/Projects/Personales/mdo.jks /tmp/backupmountdir/mdo.jks

  # unmount all veracrypt volumes
  veracrypt -t -d

  # move veracrypt volume to Dropbox
  mv /tmp/backup.tc ~/Dropbox/backup.tc

  # remove tmp mount directory
  rm -r /tmp/backupmountdir
fi

if [ $1 = 'restore' ]
then
  # wait until backup file exists
  while [ ! -f ~/Dropbox/backup.tc ]
  do
    echo -n '\nWaiting for ~/Dropbox/backup.tc to be ready'
    echo -n '.'; sleep 1;
    echo -n '.'; sleep 1;
    echo -n '.'; sleep 1;
    echo -en "\b\b\b   \b\b\b"; sleep 1;
  done

  # create tmp mount directory
  mkdir /tmp/backupmountdir

  # mount veracrypt volume
  veracrypt -t ~/Dropbox/backup.tc /tmp/backupmountdir --pim=0 --protect-hidden=no

  # extract sshbackup tar into .ssh
  pushd ~;
  tar -zxvf /tmp/backupmountdir/sshbackup.tar.gz
  popd;

  # extract gnupgbackup tar into .gnupg
  pushd ~;
  tar -zxvf /tmp/backupmountdir/gnupgbackup.tar.gz
  popd;

  # copy sensitive files to their correct location
  mkdir -p ~/Projects/FOX/
  mkdir -p ~/Projects/Personales/
  cp /tmp/backupmountdir/.npmrc ~/.npmrc
  cp /tmp/backupmountdir/.fox.ovpn ~/.fox.ovpn
  cp /tmp/backupmountdir/.okta-aws ~/.okta-aws
  cp /tmp/backupmountdir/.cpe-cli.json ~/.cpe-cli.json
  cp /tmp/backupmountdir/.fox_aws_keys ~/Projects/FOX/.aws_keys
  cp /tmp/backupmountdir/mdo.jks ~/Projects/Personales/mdo.jks

  # unmount all veracrypt volumes
  veracrypt -t -d

  # remove tmp mount directory
  rm -r /tmp/backupmountdir
fi
