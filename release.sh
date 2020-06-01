#!/usr/bin/env bash
if ! [ -x "$(command -v hub)" ]; then
    echo "hub not found on PATH, go to https://hub.github.com/"
    exit -1
fi

# [ $(hub sync | grep warning) ]
if [[ -n $(git status -s) ]] ; then
	echo 'modified/untracked files found'
	git status -s
fi

if [[ -n $(git --no-pager log --oneline origin/master..master) ]] ; then
	echo "unpushed commits found"
	git --no-pager log --oneline origin/master..master
fi

read -r -p "Are you sure you want to tag a release? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	TAG=$(date +"r%Y.%m.%d")
    hub release create $TAG
    
else
    exit -1
fi
