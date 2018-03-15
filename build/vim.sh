#!/usr/bin/env bash
set -e

SOURCE_DIR="$HOME/.cache/siho-build/vim"
VERSION="8.0.1542"


if [ ! -d $SOURCE_DIR ]; then
    git clone https://github.com/vim/vim.git $SOURCE_DIR
    cd $SOURCE_DIR
else
    cd $SOURCE_DIR
    git reset HEAD --hard
    git checkout master
    git pull
fi

git checkout -q tags/v$VERSION

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

make VIMRUNTIMEDIR=$HOME/.local/share/vim/vim80
make install
