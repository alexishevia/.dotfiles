# sysconfig
scripts to configure my dev environment

These scripts should allow me to reconstruct my entire development environment on a blank Ubuntu machine.

## Usage
```
# Download repo
sudo apt install wget unzip
wget https://github.com/alexishevia/.sysconfig/archive/master.zip
unzip master.zip
rm master.zip
cd .sysconfig-master

# Backup
~/.sysconfig/backup.sh

# Restore
~/.sysconfig/restore.sh
```
