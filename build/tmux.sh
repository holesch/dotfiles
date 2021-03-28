#!/bin/sh
set -e

src="$HOME/.cache/siho-build/tmux"
version="3.2-rc"

if [ ! -d "$src" ]; then
    git clone https://github.com/tmux/tmux "$src"
    cd "$src"
else
    cd "$src"
    git reset HEAD --hard
    git fetch
fi

git checkout -q "tags/$version"
sed -i '/sys\/queue\.h/d' proc.c
sh autogen.sh
./configure --prefix="$HOME/.local"
make install
