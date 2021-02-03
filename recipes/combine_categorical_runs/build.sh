autoreconf --force --install
./configure --prefix=$PREFIX --with-boost=$PREFIX --with-boost-libdir=$PREFIX/lib 
make CPPFLAGS=""
make install
