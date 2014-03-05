IS_MAC=

if [[ `env | grep Apple` ]]; then
    IS_MAC=true
fi

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ git:\1 /'
}
function proml {
    local BLUE="\[\033[0;34m\]"
    # OPTIONAL - if you want to use any of these other colors:
    local RED="\[\033[0;31m\]"
    local LIGHT_RED="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local WHITE="\[\033[1;37m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local LIGHT_BLUE="\[\033[1;36m\]"
    # END OPTIONAL
    local DEFAULT="\[\033[0m\]"
    if [ $IS_MAC ]; then
        PS1="\w$LIGHT_BLUE\$(parse_git_branch)$DEFAULT> "
    else
        PS1="\h:\w$LIGHT_BLUE\$(parse_git_branch)$DEFAULT> "
    fi
}
proml

if [ $IS_MAC ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
else
    export LC_ALL=en_US.utf8
    export LANG=en_US.utf8
fi


if [ -z $IS_MAC ]; then
    SCREEN_NAME="$USER"vim;
    if [[ $TERM != screen* ]]; then
        if [ `screen -ls | grep $SCREEN_NAME` -z ]; then
            screen -S $SCREEN_NAME;
        else
            screen -x $USER/$SCREEN_NAME;
        fi
    fi
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi    
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
