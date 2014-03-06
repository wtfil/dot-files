#!/bin/bash
DIR=~/ubuntu-env
PROFILE=~/.bashrc

git clone git@github.com:wtfil/ubuntu-env.git $DIR
if hash apt-get 2>/dev/null; then
    sudo apt-get install screen
    sudo chmod +s /usr/bin/screen
    sudo chmod 755 /var/run/screen
    cp $DIR/.screenrc ~
else
    echo 'apt-get is not find; screen is not instaled';
fi;

cp $DIR/.bashrc ~
ln -sf $PROFILE ~/.profile
ln -sf $PROFILE ~/.bash_login
cp $DIR/.git-completion.bash ~
cp $DIR/.bash_aliases ~
cp $DIR/.vimrc ~
cp -r $DIR/.vim ~

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
