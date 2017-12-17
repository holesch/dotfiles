#!/usr/bin/env bash
set -e

# Install dependencies
apt-get install -y \
    g++ \
    autoconf \
    automake \
    cmake3 \
    libluajit-5.1-dev \
    libjemalloc-dev \
    luajit \
    luarocks \
    gperf \

luarocks install mpack
luarocks install lpeg
