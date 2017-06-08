#!/bin/bash
# a script for checking out each remote branches in remote/
# usage: update-local-branches.sh <pull-remote-name> <push-remote-name>

# save the current branch name
current_branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' | sed 's/^. //'`

# fetch all first
#git fetch --all --tags

# TODO: simplify this
branch=`git remote show $1 | grep -v "Fetch" | grep -v "Push" | grep -v "HEAD" | grep -v "Local" | grep -v "Remote" | grep -v '*' | grep -v "up to date" | awk '{print $1}'`
linenumbers=`echo -n "$branch" | wc -l`

for branches in $branch;
do
    count=$((count + 1))
    togo=$((linenumbers - count))
    echo "$togo branches to go"
    git checkout $branches;
    if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]]; then
        git pull $1 $branches
    else
        echo "$branches synced"
    fi
    if [[ $(git status 2> /dev/null | sed -n '2p' | sed 's/Your branch is up-to-date with //g' | sed 's/'\''//g' | sed 's/\.$//') != "$2/$branches" ]];then
        git push $2 $branches --set-upstream
    else
        echo "$branches synced"
    fi
done

git checkout $current_branch
