~/.vimperatorrc:
	ln -s $(PWD)/vimperatorrc ~/.vimperatorrc

~/.zshrc:
	ls -s $(PWD)/zshrc ~/.zshrc
	ifeq ($(wildcard ~/.oh-my-zsh),)
		$(shell cd ~; curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh)
	endif
