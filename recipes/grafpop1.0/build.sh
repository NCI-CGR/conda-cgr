mkdir $PREFIX/bin
cp grafpop $PREFIX/bin

mkdir $PREFIX/share
mkdir $PREFIX/share/grafpop
cp -R data/* $PREFIX/share/grafpop
export GRAFPATH="$PREFIX/share/grafpop"

