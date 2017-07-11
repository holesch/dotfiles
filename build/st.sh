#/usr/bin/env bash
set -e

VERSION="0.7"
SOURCE_DIR="$HOME/.cache/siho-build/st/st-$VERSION"
ST_DIR=$(dirname $SOURCE_DIR)

rm -rf $ST_DIR
mkdir -p $ST_DIR
curl http://dl.suckless.org/st/st-$VERSION.tar.gz | tar xzC $ST_DIR
cd $SOURCE_DIR

make clean install PREFIX=$HOME/.local

