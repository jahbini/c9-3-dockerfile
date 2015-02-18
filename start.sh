#! /bin/bash

IP=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

(cd /c9sdk && node server -l $IP -w /workspace -p 80)
