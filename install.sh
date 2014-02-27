#!/bin/bash
DIR=~/ubuntu-env
PROFILE=~/.bashrc
git clone git@github.com:wtfil/ubuntu-env.git $DIR
if hash apt-get 2>/dev/null; then
    sudo apt-get install screen
    sudo chmod +s /usr/bin/screen
    sudo chmod 755 /var/run/screen
    if [ -z `grep '#autoload screen' $PROFILE` ]; then
        cat '#autoload screen' >> $PROFILE
        cat $DIR/.auto-screen.sh >> $PROFILE
    fi;
    cp $DIR/.screenrc ~
else
    echo 'apt-get in not find; screen is not instaled';
fi;
cp $DIR/.vimrc ~
cp -r $DIR/.vim ~
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
