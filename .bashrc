###############################################################################
##                                  Bashrc                                   ##
###############################################################################

# If not running interactively, don"t do anything
[ -z "$PS1" ] && return

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/go/bin:$PATH

# History Details
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don"t overwrite it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Set 256 color scheme
export TERM='screen-256color'

# Include Bash External Files
source ~/.bash_vars
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_python
source ~/.bash_conditionals

# Set PS1
PS1="$NewLine$BIWhite$User$ColorOff on $BIWhite$Host$ColorOff in $BIBlue$PathShort$ColorOff \$(current_git_branch)$NewLine$BIWhite$LineOpener$ColorOff "

# Add Golang path
export GOPATH="/var/lib/golang"
