#/usr/bin/env bash
set -e

version="0.8.5"
src="$HOME/.cache/siho-build/st/st-$version-test"

rm -rf $src
mkdir -p $src
curl https://dl.suckless.org/st/st-$version.tar.gz | tar -xz --strip-components=1 -C $src
cd $src

awk '
/char \*font/ {sub(/pixelsize=[0-9]+/, "pixelsize=16")}
/int allowwindowops/ {sub(/0/, "1")}
{print}
' config.def.h > config.h

make clean install PREFIX=$HOME/.local
