###############################################################################
##                                  Bashrc                                   ##
###############################################################################

# If not running interactively, don"t do anything
[ -z "$PS1" ] && return

# Include Bash External Files
source ~/.bash_vars
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_python

 # Load local items for things not in VC
[[ -f "$HOME/.bash_local" ]] && source "$HOME/.bash_local"

# History Details
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don"t overwrite it
shopt -s histappend

# Check 256 color scheme correctly
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# Set PS1
PS1="$NewLine$BIWhite$User$ColorOff on $BIWhite$Host$ColorOff in $BIBlue$PathShort$ColorOff \$(current_git_branch)$NewLine$BIWhite$LineOpener$ColorOff "

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.config/composer/vendor/bin

# Add Golang path
export GOPATH="$HOME/godeps/"

# Setup NVM
export NVM_DIR="/home/dan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Setup RVM
export PATH="$PATH:$HOME/.rvm/bin"

if command_exists $GOPATH/bin/gophersay ; then
    $GOPATH/bin/gophersay;
else
    echo "Gophersay not installed. Check out https://github.com/adamryman/gophersay for details";
fi
