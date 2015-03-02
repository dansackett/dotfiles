# If not running interactively, don"t do anything
[ -z "$PS1" ] && return

# History Details
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don"t overwrite it
shopt -s histappend

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Check for colored support
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

# Check 256 color scheme correctly
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# Add current git branch to terminal
function current_git_branch {
    # Find current Git changes
    changes=$([[ `git status --porcelain 2> /dev/null` ]] && echo -e "changes")

    # If changes, red branch. If not, green branch
    if [ "$changes" ]; then
        # Red
        branch_name=$(echo -e "──[ \e[1m\e[31m\1\e[0m\e[0m ]")
    else
        # Green
        branch_name=$(echo -e "──[ \e[1m\e[32m\1\e[0m\e[0m ]")
    fi

    # Final branch output
    git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/$branch_name/"
}

# Use colored prompt
if [ "$color_prompt" = yes ]; then
    PS1="\n┌─[ \e[32m\e[1m\u\e[0m\e[0m ]──[ \e[1m\e[94m\w\e[0m\e[0m ]\$(current_git_branch)\n└──▶ \e[1m$\e[0m "
else
    PS1="${debian_chroot:+($debian_chroot)}\w\ \$(current_git_branch)"
fi

unset color_prompt

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

################################################
#################### PYTHON ####################
################################################

# Virtualenv stuff
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/projects
export PIP_VIRTUALENV_BASE=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias mkvirtualenv="mkvirtualenv --no-site-packages --distribute"

# Stop python from generating bytecode files
export PYTHONDONTWRITEBYTECODE=1

# Load .pythonrc.py in the python interpreter
[ -f ~/.pythonrc.py ] && export PYTHONSTARTUP=~/.pythonrc.py

#################################################
#################### ALIASES ####################
#################################################

colorflag="--color"

# Enable color support of many features
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls --color=auto"
    alias grep="grep --color=auto"
fi

#################### File Commands ####################
# Some ls aliases
alias l="ls -l ${colorflag}"
alias la="ls -la ${colorflag}"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"


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
alias sudo="sudo "

# Alias vim to gvim
alias vim=gvim

# Serve current working directory
alias serve="python -m SimpleHTTPServer"

#################### Various ####################
# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Make gvim act properly with menu nonsense
alias gvim="UBUNTU_MENUPROXY= gvim"

################### Path #######################
export PATH=$PATH:/usr/local/go/bin
