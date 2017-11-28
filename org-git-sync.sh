#!/bin/sh
# add org files changes to the repository
# run this file on cron to run regularly
# example:
# 0 * * * * ~/bin/org-git-sync.sh
# will run the script hourly
# Christian Alexander <alexforsale@yahoo.com>

REPOS="org personal-org journal"

for REPO in $REPOS
do
    echo "Repository: $REPO"
    cd ~/repo/linux/$REPO
    # remove deleted files first
    git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
    # add new files
    git add . >/dev/null 2>&1
    git commit -m "$(date)"
    # check if there's internet connection
    nc -z 8.8.8.8 53  >/dev/null 2>&1
    online=$?
    if [ $online -eq 0 ]; then
        echo "connected to internet"
        remote=$(git remote)
        branch=$(git for-each-ref refs/heads | cut -d/ -f3)
        echo "pushing to $remote/$branch"
        git push $remote $branch
    else
        echo "no internet connection"
    fi
done
