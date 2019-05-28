#
# /etc/bash.bashrc
#
EDITOR=vim
VISUAL=vim
export RANGERCD=true

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

#without timestamp
#PS1="\[$(tput bold)\]\[\033[38;5;165m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;129m\]@\[$(tput sgr0)\]\[\033[38;5;32m\]\h\[$(tput sgr0)\]\[\033[38;5;47m\]>>\[$(tput sgr0)\]"

#with timestamp
PS1="\D{%T}\[$(tput bold)\]\[\033[38;5;165m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;129m\]@\[$(tput sgr0)\]\[\033[38;5;32m\]\h\[$(tput sgr0)\]\[\033[38;5;47m\]>>\[$(tput sgr0)\]"

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
#alias youtoob="youtube-dl --extract-audio --audio-format vorbis -o \"%(title)s.%(ext)s\" $1"
#this just downloads the audio directly, then converts, instead of downloading the whole video then stripping the audio out
alias youtoob="youtube-dl -f bestaudio --audio-format vorbis -o \"%(title)s.%(ext)s\" $1"
alias xserver="Xvfb :1 -screen 0 800x600x16"
alias elel="cd /srv/projx/cs315/"
alias lst="ls -t|head"
#centos/rhel
alias ll="ls -l"
alias la="ls -al"
