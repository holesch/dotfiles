#!/bin/sh
set -e

src="$HOME/.cache/siho-build/fzy"

if [ ! -d "$src" ]; then
    git clone https://github.com/jhawthorn/fzy "$src"
fi

cd "$src"
git reset HEAD --hard
git fetch
git checkout 395a2534aca4a704da7501c5e79268420e41d174

make config.h
awk '
/SCORE_GAP_INNER/ {$3 = "-0.03"}
/SCORE_MATCH_DOT/ {$3 = "0.8"}
{print}
' 'config.h' > 'config.h.tmp'
mv config.h.tmp config.h

make
strip fzy
make PREFIX="$HOME/.local" install
