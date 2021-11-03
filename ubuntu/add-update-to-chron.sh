#!/bin/bash
cp update.sh /usr/local/bin/
echo "01 * * * * root /usr/local/bin/update.sh >> /home/haydon/update.log" >> /etc/crontab

