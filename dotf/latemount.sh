#!/bin/bash
while[ -z "/srv/blue" ]
  sleep 1
  notify-send "waiting for conn"
  bash /home/liam/.bin/mount.sh
