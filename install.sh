#!/bin/bash
DIR=~/ubuntu-env
git clone git@github.com:wtfil/ubuntu-env.git $DIR
if hash apt-get 2>/dev/null; then
    sudo apt-get install screen
    sudo chmod +s /usr/bin/screen
    sudo chmod 755 /var/run/screen
    cat $DIR/.auto-screen.sh >> ~/.bashrc
    echo ok;
else
    echo 'apt-get in not find';
fi;
cp .vimrc ~
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
