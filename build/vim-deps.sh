#!/usr/bin/env bash
set -e

# Install dependencies
apt-get install -y \
    libncurses5-dev \
    python3-dev \
    libx11-dev \
    libxtst-dev \
    libxt-dev \
    libsm-dev \
    libxpm-dev
