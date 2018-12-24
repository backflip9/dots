#!/bin/bash
status=`xinput --list-props "SynPS/2 Synaptics TouchPad"| grep 140`
if [[ "	Device Enabled (140):	1" == $status ]]
then
xinput --set-prop "SynPS/2 Synaptics TouchPad" 140 0
notify-send "touchpad disabled"
fi

if [[ "	Device Enabled (140):	0" == $status ]]
then
xinput --set-prop "SynPS/2 Synaptics TouchPad" 140 1
notify-send "touchpad enabled"
fi
