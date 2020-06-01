#!/usr/bin/env bash
if ! [ -x "$(command -v hub)" ]; then
    echo "hub not found on PATH, go to https://hub.github.com/"
    exit -1
fi

TAG=$(date +"r%Y.%m.%d")

hub sync
hub release create $TAG
git pull
