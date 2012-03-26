#!/bin/bash
NAME="$USER"vim;
if [ "$TERM" = "screen" ]; then
  exit 0;
fi;
if [ `screen -ls | grep $NAME` -z ]; then
  screen -e ^Pp -S $NAME;
else
  screen -e ^Pp -x $USER/$NAME;
fi;
