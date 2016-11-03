#!/bin/bash
set -e

# Change uid and gid of unprivileged user to match current dir's owner
if [ "$MAP_UID" != "no" ]; then
    if [ ! -d "$MAP_UID" ]; then
        MAP_UID=$PWD
    fi

    uid=$(stat -c '%u' "$MAP_UID")
    gid=$(stat -c '%g' "$MAP_UID")

    usermod -u $uid python 2> /dev/null && {
      groupmod -g $gid python 2> /dev/null || usermod -a -G $gid python
    }
fi
