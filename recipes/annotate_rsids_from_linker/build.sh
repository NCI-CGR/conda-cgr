#!/usr/bin/env bash
autoreconf --force --install
./configure --prefix=$PREFIX
make LDFLAGS="-L$PREFIX/lib"
make install
