#/usr/bin/env bash
set -e

SOURCE_DIR="$HOME/.cache/siho-build/tmux"
VERSION="2.5"

if [ ! -d $SOURCE_DIR ]; then
    git clone https://github.com/tmux/tmux $SOURCE_DIR
    cd $SOURCE_DIR
else
    cd $SOURCE_DIR
    git reset HEAD --hard
    git checkout master
    git pull
fi

git checkout -q tags/$VERSION
sh autogen.sh
./configure --prefix=$HOME/.local
make install

