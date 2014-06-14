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

~/.offlineimaprc: ~/.offlineimap.py
	ln -s $(PWD)/offlineimaprc ~/.offlineimaprc

~/.offlineimap.py:
	ln -s $(PWD)/offlineimap.py ~/.offlineimap.py

offlineimap-sysctl:
	echo "[Unit]
	Description=Start offlineimap as a daemon
	Requires=network.target
	After=network.target

	[Service]
	User=%i
	ExecStart=/usr/bin/offlineimap
	KillSignal=SIGUSR2
	Restart=always

	[Install]
	WantedBy=multi-user.target
	" > /etc/systemd/system/offlineimap@.service
	systemctl offlineimap enable

offlineimap-update:
	offlineimap

.PHONY:
offlineimap: ~/.offlineimaprc

.PHONY:
offlineimap-clean:
	rm -rf ~/.offlineimaprc ~/.offlineimap.py
