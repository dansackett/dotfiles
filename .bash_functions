

# Add current git branch to terminal
function current_git_branch {
    # Find current Git changes
    changes=$([[ `git status --porcelain 2> /dev/null` ]] && echo -e "changes")

    # If changes, red branch. If not, green branch
    if [ "$changes" ]; then
        # Red
        branch_name=$(echo -e "on \e[1m\e[31m\1\e[0m\e[0m")
    else
        # Green
        branch_name=$(echo -e "on \e[1m\e[32m\1\e[0m\e[0m")
    fi

    # Final branch output
    git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/$branch_name/"
}

# Check that a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

# Extract a compressed file easily
extract ()
  {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz) tar xzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjf "$1" ;;
            *.tgz) tar xzf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
       esac
    else
        echo "'$1' is not a valid file"
    fi
  }
