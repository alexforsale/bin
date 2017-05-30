#!/bin/bash
# a script to push all local branches to remote repository one by one
# Christian Alexander <alexforsale@yahoo.com>
# usage: push-all-local-branch.sh <remotename>
for branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
    git push $1 $branch --set-upstream
done
