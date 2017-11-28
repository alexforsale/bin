#!/bin/sh
# add org files changes to the repository
# Christian Alexander <alexforsale@yahoo.com>

REPOS="org org-mode personal-org private-user-setting"

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
