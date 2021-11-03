#!/bin/bash

# run apt update just once

LOCKFILE=/tmp/lock.txt
if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then
    echo "Update already running"
else

  # make sure the lockfile is removed when we exit and then claim it
  trap "rm -f ${LOCKFILE}; exit" INT TERM EXIT
  echo $$ > ${LOCKFILE}

  # do stuff
  sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
  echo Complate.
  rm -f ${LOCKFILE}
fi 
