#!/bin/bash +x

# define usage
usage() {
    echo "Usage: $0 project-path"
    exit 1
}

# check if there's internet connection
# need =netcat= package
check_connection() {
    nc -z 8.8.8.8 53 >/dev/null 2>&1
    online=$?
    if [ $online -eq 0 ]; then
        echo "connected to internet"
    else
        echo "no internet"
        exit 1
    fi
}

check_emacs_instance(){
    if (ps aux | grep "emacs" | grep -v "grep" > /dev/null);then
        echo "emacs is running"
        GOAHEAD=0
    else
        echo "emacs is not running"
        GOAHEAD=1
    fi
}

update_project(){
    while [ $# -ne 0 ] # or while [ -n "$1" ]
    do
        echo "Current project: $1"
        cd $1
        if [[ -z $(git status -uno --porcelain) ]]; then
            echo "repo is clean, pulling from remote repository"
            if [[ "$(git remote)" = *$'\n'* ]]; then
                # alexforsale have a remote
                if [[ ! -z $(git remote | grep "alexforsale") ]];then
                    if [[ ! -z $("$1" | grep "emacs") ]];then
                        echo "emacs or .emacs.d repository"
                        check_emacs_instance
                        git push alexforsale HEAD
                    else
                        git pull --all
                    fi
                fi
            else
                git pull
            fi
        else
            echo "project: $1 is not clean"
            echo "moving to next project"
            shift
        fi
    done
}

# invoke usage
[[ $# -eq 0 ]] && usage
check_connection
update_project $#
