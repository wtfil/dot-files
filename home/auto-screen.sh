#!/bin/bash
NAME="$USER"vim;
if [ "$TERM" = "screen" ]; then
  exit 0;
fi;
if [ `screen -ls | grep $NAME` -z ]; then
  screen -e ^Xx -S $NAME;
else
  screen -e ^Xx -x $USER/$NAME;
fi;
