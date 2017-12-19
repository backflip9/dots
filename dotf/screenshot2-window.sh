#!/bin/bash
xfce4-screenshooter -w --clipboard
filename="/home/liam/Pictures/`date`.png"
xclip -selection clipboard -t image/png -o > "$filename"
if [[ -f $filename ]]
then
  notify-send "selected window saved to $filename"
fi
