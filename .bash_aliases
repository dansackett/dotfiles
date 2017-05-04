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

# Serve current working directory
alias serve="python -m SimpleHTTPServer"

# Make gvim act properly with menu nonsense
alias gvim="UBUNTU_MENUPROXY= gvim"

# Check system usage
alias usage='df -h'
alias space='du -sh ./*'

# Ops
alias flushdns='dscacheutil -flushcache'
alias reboot='sudo reboot'
alias shutoff='sudo shutdown -h now'

# Utils
alias open_dir='gnome-open .'
alias home='cd ~'
alias projects='cd ~/projects'
alias docs='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias pics='cd ~/Pictures'
alias music='cd ~/Music'
alias movies='cd ~/Movies'
alias desktop='cd ~/Desktop'
alias ssh_dir='cd ~/.ssh'
alias pub_key='cat ~/.ssh/id_rsa.pub | xclip; echo "public key copied to clipboard"'
alias hosts='sudo vim /etc/hosts'
alias vundle='vim +BundleInstall +qall'
alias lipsum='echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada risus eu magna posuere eu laoreet odio ornare. Proin malesuada gravida magna at lacinia. Donec metus erat, rutrum sit amet faucibus quis, mattis at sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean feugiat nibh in quam facilisis a rutrum risus malesuada. Fusce libero libero, scelerisque eget luctus a, blandit vel nisi. Proin elit nisi, adipiscing nec congue et, ornare vel enim. Nam orci dui, volutpat vitae fringilla vitae, scelerisque ut neque. Etiam libero orci, consequat ac porttitor a, feugiat nec orci. Nullam volutpat rhoncus dolor sed pellentesque. Etiam ornare, enim molestie semper imperdiet, urna ligula porta massa, in tempor diam quam ut velit. Ut sit amet nulla sem, pellentesque bibendum elit. Sed lectus libero, iaculis a vestibulum at, laoreet tempor orci. Praesent scelerisque urna et velit eleifend viverra." | xclip; echo "copied to clipboard";'
alias dotfiles='cd ~/dotfiles'
alias dotinstall='workon dotfiles && python ./build.py && cd -'
alias secret_key='python -c "import random; print \"\".join([random.SystemRandom().choice(\"abcdefghijklmnopqrstuvwxyz0123456789\!\@\#\$\%\^\&\*\(\-\_\=\+\)\") for i in range(50)])" | xclip; echo "copied to clipboard";'

# Tmux
alias t='tmux'
alias tat='tmux attach -t'
alias tnew='tmux new-session -s'
alias tkill='tmux kill-session -t'
alias tkillall="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# Scripts
alias tunnel='bash ~/tunnel.sh'
alias kill_tunnel='bash ~/tunnel.sh --kill'

# Golang
alias golint='$GOPATH/bin/golint '

# Python
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
