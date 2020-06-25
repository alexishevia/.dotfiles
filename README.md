# dotfiles
scripts to configure my dev environment

These scripts should allow me to reconstruct my entire development environment on a blank Pop! OS 20.04 machine.

## Usage
```sh
# Download repo
sudo apt install wget curl unzip
wget https://github.com/alexishevia/.dotfiles/archive/master.zip
unzip master.zip
rm master.zip
cd .dotfiles

# Backup
~/.dotfiles/backup.sh

When running 'backup', you will be asked:
1. The password for the new teracrypt volume to create
2. Keyfile - leave the default value of [none]
3. Random characters
4. The same password as #1
5. Keyfile - leave the default value of [none]
6. Your linux sudo password

# Restore
~/.dotfiles/restore.sh
```
