#!/bin/bash
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
