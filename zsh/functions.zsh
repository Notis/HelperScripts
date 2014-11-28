# Give the names of the original and copied file and will get the
# compaltetion progress.
function cpprg {
    du $1 | awk '{print $1}' | tail -2 \
	| python -c "a = float(raw_input()); b = float(raw_input()); print a/b"
}

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


function ghc {
    if [[ "$1" = $(basename "$1") ]]; then
	git clone "git@github.com:fakedrake/$1" $2 ||
	git clone "git@github.com:codebender/$1" $2
    else
	git clone "http://github.com/$1"
    fi

    cd $(basename "$1")
}


function ec {
    emacsclient "$1" &
}
