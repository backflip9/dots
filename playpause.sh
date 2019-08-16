#!/bin/bash
#this is kind of stupid cause cmus-remote has a built-in play/pause feature but i read the man page wrong
variable=`cmus-remote -Q | head -n 1`

if [[ "status playing" == "$variable" ]]
then
	cmus-remote -u
	notify-send "cmus paused"
fi
if [[ "status paused" == "$variable" ]] 
then
	cmus-remote -p
	notify-send "cmus playing"
fi
