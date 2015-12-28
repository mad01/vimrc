#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone git://github.com/mad01/vimrc.git "$VIMHOME"
cd "$VIMHOME"

./install-vimrc.sh

echo "mad01's vimrc is installed."
