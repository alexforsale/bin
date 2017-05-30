#!/bin/bash
# a script for creating tracking branches except master,
# taken from https://stackoverflow.com/questions/67699/how-to-clone-all-remote-branches-in-git

for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
    git branch --track "${branch##*/}" "$branch"
done
