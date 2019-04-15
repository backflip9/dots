#!/bin/bash
#xscreensaver-command -watch | \
xfconf-query -c xfce4-notifyd -p /do-not-disturb -s true
xscreensaver-command -watch | cut -d " " -f1 | \
while read k
do
  if [[ $k -eq "UNBlANK" ]]
  then
    break
  fi
  echo "line: " $k
done

xfconf-query -c xfce4-notifyd -p /do-not-disturb -s false
