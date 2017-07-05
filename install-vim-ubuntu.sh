#!/usr/bin/env bash
set -e

# Install dependencies
sudo apt-get install -y \
    libncurses5-dev \
    libluajit-5.1-dev \
    python3-dev \
    libperl-dev \
    tcl-dev \
    ruby-dev \
    libx11-dev \
    libxtst-dev \
    libxt-dev \
    libsm-dev \
    libxpm-dev

# Fix libluajit paths
sudo ln -s /usr/include/luajit-2.0/ /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/libluajit-5.1.so /usr/lib/x86_64-linux-gnu/libluajit.so

# Clone vim sources
mkdir -p ~/src
git clone https://github.com/vim/vim.git ~/src/vim

cd ~/src/vim
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
