.PHONY : zsh vimperator

all: zsh vimperator emacs

zsh: ~/.zshrc ~/.oh-my-zsh

vimperator: ~/.vimperatorrc

~/.vimperatorrc:
	ln -s $(PWD)/vimperatorrc ~/.vimperatorrc

~/.zshrc:
	ln -s $(PWD)/zshrc ~/.zshrc

~/.oh-my-zsh:
	ifeq ($(wildcard ~/.oh-my-zsh),)
		$(shell curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash )
	endif
