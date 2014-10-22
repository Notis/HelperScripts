#!/usr/bin/zsh

function try_source {
    file="$HOME/bin/zsh/$1"
    if [ -f "$file" ]; then
	source "$file"
    fi
}

try_source oh-my-zsh.zsh
try_source theme.zsh
try_source variables.zsh
try_source aliases.zsh
try_source functions.zsh
try_source bash_compat.zsh
try_source mit.zsh
# try_source thinksilicon.zsh
try_source python.zsh
try_source serial.zsh
