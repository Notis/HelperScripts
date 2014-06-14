
if [ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R -N'
else
    echo "Less highlighting scripts not found, install it with"
    echo "\t$ sudo apt-get install source-highlight"
fi

export EDITOR='emacsclient'
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/.rvm/bin
