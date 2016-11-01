#!/bin/bash
DIR=~/dot-files
PROFILE=~/.bashrc

if hash apt-get 2>/dev/null; then
    sudo apt-get install -y screen git vim
fi;
if hash yum 2>/dev/null; then
    sudo yum -y install git
    sudo yum -y install vim
    sudo yum -y install screen
fi;

git clone git@github.com:wtfil/dot-files.git $DIR

if hash screen 2>/dev/null; then 
   sudo chmod +s /usr/bin/screen
   sudo chmod 755 /var/run/screen
   cp $DIR/.screenrc ~
fi

cp $DIR/.bashrc ~
ln -sf $PROFILE ~/.profile
ln -sf $PROFILE ~/.bash_login
cp $DIR/.git-completion.bash ~
cp $DIR/.gitconfig ~
cp $DIR/.bash_aliases ~
cp $DIR/.npmrc ~
cp $DIR/.vimrc ~
cp -r $DIR/.vim ~
cp $DIR/.mongorc.js ~

if [ $TERM=='cigwin' ]; then
    mkdir -p ~/AppData/Roaming/Console/
    cp $DIR/console.xml ~/AppData/Roaming/Console/
    cp $DIR/ConEmu.xml ~/AppData/Roaming/
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

. ~/.bashrc
