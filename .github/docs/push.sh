#!/usr/bin/env sh

TOKEN=$1

if [ -f bap_commit ]; then
    repo="https://${GITHUB_ACTOR}:${TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
    git config --global user.name $GITHUB_ACTOR
    git config --global user.email "action-noreply@github.com"

    git add bap/api
    git commit -m "cat bap_commit"
#    git push $remote_repo master # TODO!
    git push $remote_repo add-actions
fi
