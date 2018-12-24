#!/bin/bash
#mount blue if i can't find cs115 dir
if [ ! -d /srv/blue/cs115 ]
then
  sshfs lschroth@blue:/home/student/lschroth/ /srv/blue -o IdentityFile=/home/liam/.cert/blueppk,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
  if [ ! -d /srv/blue/cs115 ]
  then
    notify-send "couldn't mount blue"
  else
    notify-send "mounted blue"
  fi
else
  notify-send "blue is already mounted"
fi
#mount vibrant if i can't find movies dir
if [ ! -d "/srv/vibrant/movies" ]
then
  sshfs liam@cabin:/srv /srv/vibrant -p 277 -o IdentityFile=/home/liam/.cert/ppk,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
  if [ ! -d "/srv/vibrant/movies" ]
  then
    notify-send "couldn't mount vibrant"
  else
    notify-send "mounted vibrant"
  fi
else
  notify-send "vibrant is already mounted"
fi
