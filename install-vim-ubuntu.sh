#!/usr/bin/env bash
set -e

# Remove previous installations
sudo apt-get remove -y \
    vim \
    vim-runtime \
    vim-tiny \
    vim-common \
    gvim \
    vim-gui-common \
    vim-nox

# Install dependencies
sudo apt-get install -y \
    libncurses5-dev \
    libluajit-5.1-dev \
    python3-dev \
    libperl-dev \
    tcl-dev \
    ruby-dev

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
    --with-compiledby='Simon Holesch <simon@holesch.de>'

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

sudo apt-get install checkinstall
sudo checkinstall -y --pkgname=vim
