#!/usr/bin/env bash
set -e

# Install dependencies
apt-get install -y \
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
ln -s /usr/include/luajit-2.1/ /usr/include/lua
ln -s /usr/lib/x86_64-linux-gnu/libluajit-5.1.so /usr/lib/x86_64-linux-gnu/libluajit.so

