#
# /etc/bash.bashrc
#
export EDITOR=vim
export VISUAL=vim
export RANGERCD=true

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1="\D{%T}\[$(tput bold)\]\[\033[38;5;165m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;129m\]@\[$(tput sgr0)\]\[\033[38;5;32m\]\h\[$(tput sgr0)\]\[\033[38;5;47m\]>>\[$(tput sgr0)\]"
#PS1="bash4.4\$"



case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
alias nginx="/usr/sbin/nginx"
#alias youtube-dl="/usr/local/bin/youtube-dl"
alias tran="bash /home/liam/.bin/transmi.sh"
alias localtran="bash /home/liam/.bin/localtransmi.sh"
#alia youtoob="youtube-dl --exract-audio --audio-format vorbis -o \"%(title)s.%(ext)s\" $1"
#this just downloads the audio directly, then converts, instead of downloading the whole video then stripping the audio out
alias youtoob="/usr/local/bin/youtube-dl --extract-audio -f bestaudio --audio-format vorbis -o \"%(title)s.%(ext)s\" $1"
alias xserver="Xvfb :1 -screen 0 800x600x16"
alias elel="cd /srv/projx/cs315/"
alias lst="ls -t|head"
#centos/rhel
alias ll="ls -l"
alias la="ls -al"
function ytd()
{
  curDate=`date +%F-%H%M`
  basePath="/srv/subsonic/Liam/talks/"
  cd $basePath
  mkdir $curDate
  /usr/local/bin/youtube-dl --extract-audio -f bestaudio --audio-format vorbis -o "$curDate/%(title)s.%(ext)s" $1
}
alias ingrep="grep -Inir"
