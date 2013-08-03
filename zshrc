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
export PATH=/home/fakedrake/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/home/fakedrake/.rvm/bin:/home/fakedrake/Sources/android-sdk-linux/tools

. $HOME/bin/py/bin/activate

[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

export WORKON_HOME=~/Envs/
export PYTHON_BIN=$(dirname $(which python))

. $PYTHON_BIN/virtualenvwrapper.sh

function ghc {
    git clone "git@github.com:$@"
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