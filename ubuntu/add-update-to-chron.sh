#!/bin/bash
cp update.sh /usr/local/bin/
grep update.sh /etc/crontab>/dev/null || echo "01 * * * * root /usr/local/bin/update.sh >> /home/haydon/update.log" >> /etc/crontab
cat /etc/crontab
