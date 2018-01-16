#!/bin/bash
FILENAME=`readlink -f -- $1`
ROOTDIR=`git rev-parse --show-toplevel`
SPEC=$2

VERSION=`cat $FILENAME | python -c "from __future__ import print_function; import sys, json; print(json.load(sys.stdin)['version'])" | sed s/v/r/`

if [ ! -d "$ROOTDIR/.$VERSION" ]
then
    if [ -z "$SPEC" ]
    then
        read -p "What is the path for the local git specification repo?" SPEC
    fi
    (cd $SPEC && git worktree prune && git worktree add --force $ROOTDIR/.$VERSION origin/$VERSION > /dev/null 2>&1 )
fi
$ROOTDIR/.$VERSION/verify.sh $FILENAME
