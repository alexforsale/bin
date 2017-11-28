#!/bin/sh
# add org files changes to the repository
# run this file on cron to run regularly
# example:
# 0 * * * * ~/bin/org-git-sync.sh
# will run the script hourly
# Christian Alexander <alexforsale@yahoo.com>

REPOS="org org-mode personal-org private-user-settings"

for REPO in $REPOS
do
    echo "Repository: $REPO"
    cd ~/repo/linux/$REPO
    # remove deleted files first
    git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
    # add new files
    git add . >/dev/null 2>&1
    git commit -m "$(date)"
done
