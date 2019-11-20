#!/bin/sh
set -e

src="$HOME/.cache/siho-build/fzy"

if [ ! -d $src ]; then
    git clone https://github.com/siho22/fzy $src
fi

cd $src
git reset HEAD --hard
git pull

make
strip fzy
make PREFIX=$HOME/.local install
