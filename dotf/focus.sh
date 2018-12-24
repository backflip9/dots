#!/bin/bash
#give focus to a window based on its process name/title bar title
var=`pgrep -il $1|wc -l`
if [[ $var = "0" ]]
then
  eval $1&
else
  if [[ $1 = "pavucontrol" ]]
  then
    wmctrl -a "Volume Control"
    exit 0
  fi
  wmctrl -a $1
  if [[ $? != 0 ]]
  then
    notify-send "more than one $1 window"
  fi
fi
