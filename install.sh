#!/bin/bash
if hash apt-get 2>/dev/null; then
    apt-get install screen
    chmod +s /usr/bin/screen
    chmod 755 /var/run/screen
    cat .auto-screen.sh >> ~/.bashrc
    echo ok;
else
    echo 'apt-get in not find';
fi;
#cp .vimrc ~
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
