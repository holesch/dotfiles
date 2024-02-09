#!/bin/sh
set -e

src="$HOME/.cache/siho-build/vim"
version="9.1.0083"


if [ ! -d $src ]; then
    git clone https://github.com/vim/vim.git $src
    cd $src
else
    cd $src
    git reset HEAD --hard
    git fetch
fi

git checkout -q tags/v$version

./configure \
    --enable-fail-if-missing \
    --enable-python3interp=yes \
    --enable-cscope \
    --enable-multibyte \
    --enable-gui=no \
    --disable-netbeans \
    --with-features=huge \
    --with-x \
    --prefix=$HOME/.local \
    --with-compiledby='Simon Holesch <simon@holesch.de>'

make VIMRUNTIMEDIR=$HOME/.local/share/vim/vim91
make -j1 install
