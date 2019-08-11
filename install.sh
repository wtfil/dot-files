#!/bin/bash
DIR=~/dot-files
PROFILE=~/.bashrc
NVIM=~/.config/nvim

if hash apt-get 2>/dev/null; then
    sudo apt-get install -y screen git vim curl
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
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ~/.git-completion.bash 2 > /dev/null
mkdir $NVIM
cp $DIR/.gitconfig ~
cp $DIR/.bash_aliases ~
cp $DIR/.npmrc ~
cp $DIR/.vimrc ~
cp $DIR/.vimrc $VIM/init.vim
cp $DIR/.inputrc ~
cp -r $DIR/.vim ~
cp $DIR/.mongorc.js ~

if [ $TERM=='cigwin' ]; then
    mkdir -p ~/AppData/Roaming/Console/
    cp $DIR/console.xml ~/AppData/Roaming/Console/
    cp $DIR/ConEmu.xml ~/AppData/Roaming/
fi

ln -s ~/.vimrc ~/.config/nvim/init.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein.sh
sh ./installer.sh ~/.cache/dein

. ~/.bashrc
