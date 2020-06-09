#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Commands
alias make='make -j8'
alias c='clear'

# Git
alias clone='git clone'
alias lg='git log'
alias com='git commit -m'
alias st='git status'

# Config files
alias xinitrc='vim ~/.xinitrc'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'

# Directories
alias home='cd ~'
alias dwn='cd ~/Downloads'
alias ..='cd ..'

export GREP_OPTIONS=' --color=auto'
export EDITOR=subl

