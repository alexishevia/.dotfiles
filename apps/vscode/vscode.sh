#!/bin/bash

set -e # exit if any command fails

# path="$HOME/.config/Code/User"
path='/mnt/c/Users/hevia/AppData/Roaming/Code/User'
if ! [ -e $path ]; then
   mkdir -p $path
fi

powershell.exe -command 'New-Item -ItemType SymbolicLink -Path C:\Users\hevia\AppData\Roaming\Code\User -Name settings.json -Value \\wsl$\Ubuntu-20.04\home\alexishevia\.dotfiles\apps\vscode\settings.json'

powershell.exe -command 'New-Item -ItemType SymbolicLink -Path C:\Users\hevia\AppData\Roaming\Code\User -Name keybindings.json -Value \\wsl$\Ubuntu-20.04\home\alexishevia\.dotfiles\apps\vscode\keybindings.json'

extensions='vscodevim.vim golang.go eamodio.gitlens alanwalk.markdown-toc alexishevia.mdo-extension-code esbenp.prettier-vscode mikestead.dotenv'
for extension in $extensions; do
  powershell.exe -command "code --install-extension $extension"
done
