#!/bin/bash
xfce4-screenshooter -r --clipboard
filename="/home/liam/Pictures/`date`.png"
xclip -selection clipboard -t image/png -o > "$filename"
if [[ -f $filename ]]
then
  notify-send "area selection saved to $filename"
fi
