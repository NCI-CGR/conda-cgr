mkdir $PREFIX/bin
cp bin/graf $PREFIX/bin
cp bin/graf_dups $PREFIX/bin
sed 's/\/usr\/local\/bin\/perl/\/usr\/bin\/env perl/' bin/PlotPopulations.pl > $PREFIX/bin/PlotPopulations.pl
sed 's/\/usr\/local\/bin\/perl/\/usr\/bin\/env perl/' bin/PlotGraf.pl > $PREFIX/bin/PlotGraf.pl
mkdir $PREFIX/share
mkdir $PREFIX/share/graf
cp -R data/* $PREFIX/share/graf
