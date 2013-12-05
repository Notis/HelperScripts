.PHONY : zsh vimperator

all: zsh vimperator

zsh: ~/.zshrc

vimperator: ~/.vimperatorrc

~/.vimperatorrc:
	ln -s $(PWD)/vimperatorrc ~/.vimperatorrc

~/.zshrc:  ~/.oh-my-zsh
	ln -s $(PWD)/zshrc ~/.zshrc

~/.oh-my-zsh:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh \
		| bash
