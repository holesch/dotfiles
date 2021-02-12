sudo apt install libgdbm-dev
./configure --enable-hcache --enable-sidebar --disable-external-dotlock --prefix=$HOME/.local
make
make install DOTLOCK_GROUP=
