#!/usr/bin/env bash
autoreconf --force --install
./configure --prefix=$PREFIX --with-boost=$PREFIX --with-boost-libdir=$PREFIX/lib
make CPPFLAGS=""
make install
mkdir -p $PREFIX/share/initialize_output_directories
cp extensions.config.yaml $PREFIX/share/initialize_output_directories
