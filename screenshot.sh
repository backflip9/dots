#!/bin/bash
filename="/home/liam/Pictures/`date`.png"
scrot "$filename"
xclip -selection clipboard -t image/png -i "$filename"
if [[ -f $filename ]]
then
  notify-send "fullscreen saved to $filename"
fi
