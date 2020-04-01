#!/bin/sh
set -e

src="$HOME/.cache/siho-build/vim"
version="8.2.0343"


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
    --enable-luainterp=yes \
    --enable-perlinterp=yes \
    --enable-python3interp=yes \
    --enable-tclinterp=yes \
    --enable-rubyinterp=yes \
    --enable-cscope \
    --enable-multibyte \
    --enable-gui=no \
    --disable-netbeans \
    --with-features=huge \
    --with-luajit \
    --with-x \
    --prefix=$HOME/.local \
    --with-compiledby='Simon Holesch <simon@holesch.de>'

make VIMRUNTIMEDIR=$HOME/.local/share/vim/vim82
make -j1 install
