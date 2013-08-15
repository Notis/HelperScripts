#!/bin/bash

function printi {echo "[INFO] $*"}

function printe {echo "[ERROR] $*"}

function setup_arch {
    # Package manager
    PAC=pacman -S

    # Packages
    PYTHON_PAC=python2
}

function setup_ubuntu {
    # Package manager
    PAC=apt-get install

    # Packages
    PYTHON_PAC=python
}

if command -v pacman; then
    printi "You are running arch"
    setup_arch
elif command -v apt-get; then
    printi "You are running ubuntu"
    setup_ubuntu
else
    printe "Cannot determine you distribution, sorry."
    exit 1
fi
