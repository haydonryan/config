#!/bin/bash
if [ -f "/etc/sudoers.d/$USER-all" ] 
then 
  echo "/etc/sudoers.d/$(logname)-all already exists"
else
  echo "$LOGNAME ALL=(ALL) NOPASSWD: ALL" | (sudo su -c 'EDITOR="tee -a" visudo -f /etc/sudoers.d/$(logname)-all')
fi
