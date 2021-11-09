#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PS1='[\[\033[01;32m\]\u\[\033[37m\]@\[\033[01;32m\]\h:\[\033[01;34m\]\w\[\033[00m\]]\n\$ '
source ~/.bash_aliases
