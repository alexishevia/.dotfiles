# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to history on every command
# see: https://superuser.com/questions/788428/how-to-port-my-current-bash-history-over-when-opening-a-tmux-session
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make `less` more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# enable 256-color support in terminal
TERM=xterm-256color

# user vim as the default editor
export EDITOR=/usr/bin/vim

# multi-line prompt
PS1='$PWD
==> '

# add ~/bin to PATH
PATH=$PATH:~/bin

# fix perl locale warning
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# add alias for open
alias open=xdg-open

# add alias to find out who is using a given port
alias whoisusing='netstat -tulpn | grep'

# add alias to print out all tags for zettelkasten
alias lstags="ag --nofilename --nobreak @@ | tr '@@' '\n' | sed 's/ //g' | sort | uniq"

# add alias for git commands
alias gco="git checkout"
alias gpull="git pull"
alias gbranch="git branch"

# prefer neovim over vim
alias vim='echo you should be using nvim instead of vim. You can use \"vimold\" if you REALLY want vim'
alias vimold="/usr/bin/vim"

#---------------------------------------
# JAVA
#---------------------------------------
# define JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-13-oracle

#---------------------------------------
# Docker
#---------------------------------------
# remove volumes which are both dangling and have no custom name
alias dockerRemoveUntaggedVolumes='docker volume rm $(docker volume ls -qf dangling=true | grep ".\{64\}")'

#---------------------------------------
# PostgreSQL
#---------------------------------------
alias pgctl='postgresql10.pgctl -D ~/snap/postgresql10/common/data -l ~/snap/postgresql10/common/logs/logfile'
alias psql='postgresql10.psql'

#---------------------------------------
# Node
#---------------------------------------
# add nvm to path
source ~/.nvm/nvm.sh

# add autocomplete for npx
complete -A command npx

# save ~/.npmrc authToken value into an NPM_TOKEN env variable
# export NPM_TOKEN=$(cat ~/.npmrc)
export NPM_TOKEN=$(grep -oP 'authToken=\K.*' ~/.npmrc)

#---------------------------------------
# Golang
#---------------------------------------
alias go="grc go" # https://stackoverflow.com/questions/27242652/colorizing-golang-test-run-output
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
PATH=$PATH:$GOPATH/bin:$GOROOT/bin

#---------------------------------------
# Android
#---------------------------------------
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

#---------------------------------------
# Python
#---------------------------------------
# When you `pip3 install` using the `--user` flag, the binary is added to the ~/.local/bin directory
export PATH=$PATH:$HOME/.local/bin

#---------------------------------------
# PHP
#---------------------------------------
# source ~/.phpbrew/bashrc

#---------------------------------------
# Ruby
#---------------------------------------
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)" # load rbenv automatically

#---------------------------------------
# FOX specific projects
#---------------------------------------
if [[ $PWD/ = $HOME/Projects/FOX/* ]];
  then
    source $HOME/Dropbox/env_vars.sh;
    source $HOME/Projects/FOX/.aws_keys;
    nvm use;
fi
if [[ $PWD/ = $HOME/Dropbox/* ]];
  then
    source $HOME/Dropbox/env_vars.sh;
    nvm use;
fi
if [[ $PWD/ = $HOME/go/src/github.com/foxbroadcasting/* ]];
  then
    source $HOME/Dropbox/env_vars.sh;
fi

# add alias to cd into foxbroadcasting golang directory
alias gofox="cd $GOPATH/src/github.com/foxbroadcasting/"
