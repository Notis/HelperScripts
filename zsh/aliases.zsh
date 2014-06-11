function avail {
    command -v "$1" >/dev/null 2>&1
}

if avail pacman ; then
    alias pup="sudo pacman -Syu"
    alias p="sudo pacman -S"
    alias pse="pacman -Ss"
fi

if avail aptitude ; then
    alias pup="sudo aptitude safe-upgrade"
    alias p="sudo aptitude install"
    alias pse="aptitude search"
fi

if avail yaourt; then
    alias yup="sudo yaourt -Syu"
    alias y="sudo yaourt -S"
    alias yse="sudo yaourt -Ss"
fi

if avail emacs; then
    alias e="emacs -Q -nw"
    alias se="sudo emacs -Q -nw"
fi

if avail systemctl; then
    alias scs="sudo systemctl start"
    alias scr="sudo systemctl restart"
    alias scp="sudo systemctl stop"
fi

alias zsh_git_hide="git config oh-my-zsh.hide-status 1"
