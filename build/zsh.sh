#/usr/bin/env bash
set -e

SOURCE_DIR="$HOME/.cache/siho-build/zsh"
VERSION="5.3.1"

if [ ! -d $SOURCE_DIR ]; then
    git clone https://git.code.sf.net/p/zsh/code $SOURCE_DIR
    cd $SOURCE_DIR
else
    cd $SOURCE_DIR
    git reset HEAD --hard
    git checkout master
    git pull
fi

git checkout -q tags/zsh-$VERSION
./Util/preconfig
./configure \
    --prefix=$HOME/.local \
    --enable-etcdir=/etc/zsh \
    --enable-zshenv=/etc/zsh/zshenv \
    --enable-zlogin=/etc/zsh/zlogin \
    --enable-zlogout=/etc/zsh/zlogout \
    --enable-zprofile=/etc/zsh/zprofile \
    --enable-zshrc=/etc/zsh/zshrc \
    --enable-maildir-support \
    --with-term-lib='ncursesw' \
    --enable-multibyte \
    --enable-function-subdirs \
    --with-tcsetpgrp \
    --enable-cap \
    --enable-pcre \
    --enable-zsh-secure-free \
    --enable-readnullcmd=pager \

make
make check
make install

