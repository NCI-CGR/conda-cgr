mkdir $PREFIX/bin
cp graf $PREFIX/bin
cp graf_dups $PREFIX/bin
sed 's/\/usr\/local\/bin\/perl/\/usr\/bin\/env perl/' PlotPopulations.pl > $PREFIX/bin/PlotPopulations.pl
sed 's/\/usr\/local\/bin\/perl/\/usr\/bin\/env perl/' PlotGraf.pl > $PREFIX/bin/PlotGraf.pl
mkdir $PREFIX/share
mkdir $PREFIX/share/graf
cp -R data/* $PREFIX/share/graf
