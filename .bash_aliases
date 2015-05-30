###############################################################################
##                              Bash Aliases                                 ##
###############################################################################

# Defaults for mkvirtualenv
alias mkvirtualenv="mkvirtualenv --no-site-packages --distribute"

colorflag="--color"
# Enable color support of many features
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls --color=auto"
    alias grep="grep --color=auto"
fi

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

# use xclip
alias xclip="xclip -sel clip"

# IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enable aliases to be sudoed
alias sudo="sudo "

# Alias vim to gvim
# alias vim=gvim

# Serve current working directory
alias serve="python -m SimpleHTTPServer"

# Make gvim act properly with menu nonsense
alias gvim="UBUNTU_MENUPROXY= gvim"
