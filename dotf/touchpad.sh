#!/bin/bash
status=`xinput --list-props 11 | grep 140`
if [[ "	Device Enabled (140):	1" == $status ]]
then
xinput --set-prop 11 140 0
notify-send "touchpad disabled"
fi

if [[ "	Device Enabled (140):	0" == $status ]]
then
xinput --set-prop 11 140 1
notify-send "touchpad enabled"
fi
