#!/bin/bash
xfce4-screenshooter -r --clipboard
filename="/home/liam/Pictures/`date +%F-%H%M%S`.png"
xclip -selection clipboard -t image/png -o > "$filename"
if [[ -f $filename ]]
then
  notify-send "area selection saved to $filename"
else
  notify-send "area selection wasn't saved"

fi
