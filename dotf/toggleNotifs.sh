#!/bin/bash
notifsOn="`xfconf-query -c xfce4-notifyd -p /do-not-disturb`"
if [[ $notifsOn == "false" ]]; then
  notify-send "disabling notifications"
  xfconf-query -c xfce4-notifyd -p /do-not-disturb -s true
else
  xfconf-query -c xfce4-notifyd -p /do-not-disturb -s false
  notify-send "enabled notifications"
fi

