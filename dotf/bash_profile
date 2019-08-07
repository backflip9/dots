#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
xExists=`pgrep -l Xorg|wc -l`
if [[ $xExists -eq 0 ]]
then
  exec startx
fi
#sleep 3
#xmodmap /home/liam/.xmodmap
