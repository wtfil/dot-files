SCREEN="auto-screen.sh"
install:
	cp .vimrc ~/
	mkdir -p ~/.vim
	mkdir -p ~/.vim/tmp/
	mkdir -p ~/.vim/tmp/swap
	mkdir -p ~/.vim/tmp/backup
	cp $(SCREEN) ~/
	chmod +x ~/$(SCREEN)
	echo ~/$(SCREEN) >> ~/.bashrc
