# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# For setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don't overwrite it
shopt -s histappend

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Colored prompt
force_color_prompt=yes

# Check for colored support
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Add current git branch to terminal
function current_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$([[ `git status --porcelain 2> /dev/null` ]] && echo "*")]/"
}

# Use colored prompt
if [ "$color_prompt" = yes ]; then
    PS1="\[\033[01;34m\]\w\[\033[00m\] \$(current_git_branch)"
else
    PS1="${debian_chroot:+($debian_chroot)}\w\ \$(current_git_branch)"
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
PS1="\n$PS1\n$ "

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Add RVM to path
PATH=$PATH:$HOME/.rvm/bin

# Make gvim act properly with menu nonsense
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias gvim='UBUNTU_MENUPROXY= gvim'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

################################################
#################### PYTHON ####################
################################################

# Virtualenv stuff
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/projects
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=~/.virtualenvs
alias mkvirtualenv='mkvirtualenv --no-site-packages --distribute'

# Stop python from generating bytecode files
# export PYTHONDONTWRITEBYTECODE=1

# Load .pythonrc.py in the python interpreter
[ -f ~/.pythonrc.py ] && export PYTHONSTARTUP=~/.pythonrc.py

#################################################
#################### ALIASES ####################
#################################################

# Enable color support of many features
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#################### File Commands ####################
# Some ls aliases
alias l="ls -l ${colorflag}"
alias la="ls -la ${colorflag}"
alias lsd='ls -l ${colorflag} | grep "^d"'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#################### Util #####################
# use xclip
alias xclip="xclip -sel clip"

# IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enable aliases to be sudoed
alias sudo='sudo '

# Alias for ACK-GREP
alias ack='ack-grep'

# Alias vim to gvim
alias vim=gvim

# todo list aliases
if [ -f ~/.todo ]; then
. ~/.todo
fi

#################### Hivelocity ####################
# Alias openvpn to work
alias openvpn="sudo openvpn --config ~/openvpn/client1.ovpn"
alias hvupdate="bash ~/hvupdate.sh"

#################### Various` ####################
# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
