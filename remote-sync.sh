#!/bin/bash
# sync local repositories with their respective remotes
# all my git repos are in ~/repo/linux/
# Christian Alexander <alexforsale@yahoo.com>

reporoot=~/repo/linux
repos=$(ls $reporoot)

for repo in $repos
do
    echo "Repository: $repo"
    cd $reporoot/$repo
    if [[ -z $(git status -uno --porcelain) ]]; then
        echo "repo is clean, pulling from remote repository"
        git pull
    else
        echo "repo is not clean, fetching remote repository instead"
        git fetch
    fi
done
