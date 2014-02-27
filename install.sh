apt-get install screen
chmod +s /usr/bin/screen
chmod 755 /var/run/screen
cat .auto-screen.sh >> ~/.bashrc
cp .vimrc ~
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
