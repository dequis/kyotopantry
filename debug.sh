#!/bin/bash


DDIRECTORY=/tmp/kyotopantry_test/

mkdir -p $DDIRECTORY

echo 'test1' > $DDIRECTORY/test1
echo 'test2' > $DDIRECTORY/test2
echo 'test3' > $DDIRECTORY/test3
echo 'test4' > $DDIRECTORY/test4

tar -czf $DDIRECTORY/tarball_a.tar.gz $DDIRECTORY/test*

echo 'test5' > $DDIRECTORY/test5

tar -czf $DDIRECTORY/tarball_b.tar.gz $DDIRECTORY/test*

CMD="./kyotopantry --verbose -j 4 $DDIRECTORY./tarball_*.tar.gz"

#gdb --args $CMD
valgrind --tool=memcheck --suppressions=.valgrind.supp --leak-check=full $CMD
#./kyotopantry --verbose $DDIRECTORY./tarball_*.tar.gz
