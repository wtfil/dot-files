#!/bin/bash
SCREEN_NAME="$USER"vim;
if [[ $TERM != screen* ]]; then
    if [ `screen -ls | grep $SCREEN_NAME` -z ]; then
        screen -S $SCREEN_NAME;
    else
        screen -x $USER/$SCREEN_NAME;
    fi;
fi;
