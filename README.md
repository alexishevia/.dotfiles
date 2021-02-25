# dotfiles
scripts to configure my dev environment

These scripts should allow me to reconstruct my entire development environment on a blank Ubuntu 20.04 vm inside wsl2.

## Additional steps to improve Windows behavior
- Remap `CAPS LOCK` to `HOME` using [sharpkeys](https://github.com/randyrants/sharpkeys/releases)
    This way, any accidental press on caps lock will not have any effect
- Follow steps 2 and 3 on the following guide to enable copy/pasting from Ubuntu's vim to Windows (and allow using gui apps):
    https://gist.github.com/necojackarc/02c3c81e1525bb5dc3561f378e921541
- Install Docker Desktop and use it as the WSL2 docker backend
    https://docs.docker.com/docker-for-windows/wsl/
- Install the [Cascadia Mono font](https://github.com/microsoft/cascadia-code) and set it as the default font for the Ubuntu WSL2 client
    I like using font size: 18
- Configure the Ubuntu WSL2 client (right click -> properties)
    * enable ctrl+c/v to copy/paste
- Install other useful software:
  * [Snagit](https://www.techsmith.com/screen-capture.html) for screen capture and image annotations
      Note: Snagit also has a [color picker](https://techsmith-13.wistia.com/medias/e52ityv9p2?embedType=async&videoFoam=true&videoWidth=854)

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
