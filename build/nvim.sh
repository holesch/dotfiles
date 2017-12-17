#!/usr/bin/env bash
set -e

SOURCE_DIR="$HOME/.cache/siho-build/nvim"
VERSION="0.2.2"


if [ ! -d $SOURCE_DIR ]; then
    git clone https://github.com/neovim/neovim $SOURCE_DIR
    cd $SOURCE_DIR
else
    cd $SOURCE_DIR
    git reset HEAD --hard
    git checkout master
    git pull
fi

git checkout -q tags/v$VERSION

make -j8 \
    DEPS_CMAKE_FLAGS=" \
        -DUSE_BUNDLED=OFF \
        -DUSE_BUNDLED_MSGPACK=ON \
        -DUSE_BUNDLED_UNIBILIUM=ON \
        -DUSE_BUNDLED_LIBTERMKEY=ON \
        -DUSE_BUNDLED_LIBVTERM=ON \
        -DUSE_BUNDLED_LIBUV=ON \
        " \
    CMAKE_EXTRA_FLAGS=" \
        -DCMAKE_INSTALL_PREFIX=$HOME/.local \
        " \
    CMAKE_BUILD_TYPE=Release

make install
