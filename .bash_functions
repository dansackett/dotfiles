

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
