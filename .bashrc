#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

  export PS1='[\[\033[01;32m\]\u\[\033[37m\]@\[\033[01;32m\]\h:\[\033[01;34m\]\w\[\033[00m\]] $(parse_git_branch)\n\$ '
source ~/.bash_aliases
