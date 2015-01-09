
if [ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R'
else
    echo "Less highlighting scripts not found, install it with"
    echo "\t$ sudo apt-get install source-highlight"
fi

export EDITOR='/usr/local/bin/emacsclient'
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/.rvm/bin
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export HOMEBREW_GITHUB_API_TOKEN=1ecb5e9cad56fc9808aff7bfa523f9a702d5a316
