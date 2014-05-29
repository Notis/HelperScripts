# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux django python pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/bin/py/bin/:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/.rvm/bin:$HOME/Sources/android-sdk-linux/tools

. $HOME/bin/py/bin/activate

[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

export WORKON_HOME=~/Envs/
export PYTHON_BIN=$(dirname $(which python))

# . $PYTHON_BIN/virtualenvwrapper.sh

function ghc {
    git clone git@github.com:$@
}

function ec {
    emacsclient "$1" &
}

alias pup="sudo pacman -Syu"
alias p="sudo pacman -S"
alias pse="sudo pacman -Ss"

alias yup="sudo yaourt -Syu"
alias y="sudo yaourt -S"
alias yse="sudo yaourt -Ss"

alias e="emacs -Q -nw"
alias se="sudo emacs -Q -nw"

mount -l | grep /tools > /dev/null && export PATH=$PATH:/tools/sparc/sparc-linux/bin
[ -d $HOME/localroot ] && export PATH=$HOME/localroot/bin:$PATH

export EDITOR='emacsclient'
export PATH="$PATH:/home/fakedrake/Projects/ThinkSilicon/xilinx-zynq-bootstrap/sources/gnu-tools-archive/GNU_Tools/bin/"

function usedotemacs {
    if [ -d $1 ] || [ -d $1/init.el ]; then
	if [ -s ~/.emacs.d ]; then
	    link_dest=$(ls -la ~ | grep .emacs.d | grep -o1 "[^ ]*$")
	    echo "Shamelessly removing the symbolic link to $link_dest"
	    rm ~/.emacs.d
	elif [ -d ~/.emacs.d ]; then
	    BACKPATH=~/Sources/dotemacs-$(date +%d-%m-%y-%H-%M-%S)
	    echo "Backup current dotemacs as $BACKPATH"
	    mv ~/.emacs.d $BACKPATH
	else
	    echo "Wow there is an .emacs.d but I have no idea what it is."
	    exit 1
	fi
    else
	echo "No can do. Not an emacs init directory."
	exit 1
    fi

    echo "Actually ~/.emacs.d linking to $1."
    ln -s $1 ~/.emacs.d
}

if [ -f $HOME/.zshrc.mit ]; then
    source $HOME/.zshrc.mit
fi

# Give the names of the original and copied file and will get the
# compaltetion progress.
function cpprg {
    du $1 | awk '{print $1}' | tail -2 \
	| python -c "a = float(raw_input()); b = float(raw_input()); print a/b"
}

alias scs="sudo systemctl start"
alias scr="sudo systemctl restart"
alias scp="sudo systemctl stop"
alias zsh_git_hide="git config oh-my-zsh.hide-status 1"

# find the first venv backwards and activate it.
pv() {
    A=./*/bin/activate;
    for i in {1..$(pwd | grep -o / | wc -l)}; do
	if bash -c "ls $A" 2> /dev/null; then
	    source $(bash -c "ls $A | head -1");
	    break;
	fi;
	A=../$A;
    done
}

# Only argument is the url. For 3.12 it would be
# https://bitbucket.org/migerh/workspace-grid-gnome-shell-extension/downloads/workspace-grid%40mathematical.coffee.gmail.com-for-3.12.zip
update_workspace_grid() {
    wget $1 -O /tmp/workspace-grid.zip
    cd ~/.local/share/gnome-shell/extensions
    unzip /tmp/workspace-grid.zip
}
