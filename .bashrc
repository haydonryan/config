#################################################
# ~/.bashrc
#################################################

# If not running interactively, don't do anything
if [ "$SHELL" != "/bin/ash" ]; then
  [[ $- != *i* ]] && return
fi

# -------------
# setup History
# -------------
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

if [ "$SHELL" != "/bin/ash" ]; then
  shopt -s checkwinsize
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# --------------------------------------------------------------------------------------------------------
# Ensure everything is colorful (untested, ripped from ubuntu .bashrc)
# --------------------------------------------------------------------------------------------------------

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if [ "$SHELL" != "/bin/ash" ]; then
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
fi

# --------------------------------------------------------------------------------------------------------
# end of untested
# --------------------------------------------------------------------------------------------------------

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ----------
# Set Prompt
# ----------

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='[\[\033[01;32m\]\u\[\033[37m\]@\[\033[01;32m\]\h:\[\033[01;34m\]\w\[\033[00m\]] $(parse_git_branch)\n\$ '
export EDITOR=nvim

# -----------------------------------
# Include included and custom aliases
# -----------------------------------
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# --------------------------------------
# Add go bin path to path and set GOPATH
# --------------------------------------
export PATH=$PATH:~/workspace/go/bin
export GOPATH=~/workspace/go

# ------------------------------------------------------------
# Set caps lock to be control key, since Caps Lock is USELESS
# ------------------------------------------------------------
if [ "$SHELL" != "/bin/ash" ]; then
  setxkbmap -option ctrl:nocaps
fi
