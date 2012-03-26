SCREEN="auto-screen.sh"
all: screen vim
screen:
	apt-get install screen
	cp $(SCREEN) ~/
	chmod +x ~/$(SCREEN)
	echo ~/$(SCREEN) >> ~/.bashrc
	chmod +s /usr/bin/screen
	chmod 755 /var/run/screen
	echo "multiuser on" >> ~/.screenrc
	echo "acladd $(SUDO_USER)" >> ~/.screenrc
	echo "termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'" >> ~/.screenrc
	chmod 775 ~/.screenrc
	chown $(SUDO_USER) ~/.screenrc
vim:
	apt-get install vim
	cp .vimrc ~/
	mkdir -p ~/.vim
	mkdir -p ~/.vim/tmp/
	mkdir -p ~/.vim/tmp/swap
	mkdir -p ~/.vim/tmp/backup
.PHONY: all screen vim
