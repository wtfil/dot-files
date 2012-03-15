#!/bin/bash
NAME="$USER"vim;
if [ "$TERM" = "screen" ]; then
  exit 0;
fi;
if [ `screen -ls | grep $NAME` -z ]; then
  screen -S $NAME;
else
  screen -x $USER/$NAME;
fi;
