mkdir $PREFIX/bin
cp grafpop $PREFIX/bin

sed 's/\/usr\/local\/bin\/perl/\/usr\/bin\/env perl/' SaveSamples.pl > $PREFIX/bin/SaveSamples.pl

mkdir $PREFIX/share
mkdir $PREFIX/share/grafpop
cp -R *.pm $PREFIX/share/grafpop #Add .pm files for perl scripts
cp -R data/* $PREFIX/share/grafpop
export GRAFPATH="$PREFIX/share/grafpop"

