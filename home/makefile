SCREEN="auto-screen.sh"
all: screen vim
screen:
	cp $(SCREEN) ~/
	chmod +x ~/$(SCREEN)
	echo ~/$(SCREEN) >> ~/.bashrc
	chmod +s /usr/bin/screen
	chmod 755 /var/run/screen
	echo "multiuser on" >> ~/.screenrc
	echo "acladd $(SUDO_USER)" >> ~/.screenrc
vim:
	cp .vimrc ~/
	mkdir -p ~/.vim
	mkdir -p ~/.vim/tmp/
	mkdir -p ~/.vim/tmp/swap
	mkdir -p ~/.vim/tmp/backup
.PHONY: all screen vim
