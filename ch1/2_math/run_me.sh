#!/bin/sh

set -xe

cd cmath
gcc -fPIC -shared -g *.c -o libcmath.so

cd ../pymath
CFLAGS="-I`pwd`/../cmath/" LDFLAGS="-L`pwd`/../cmath/" python setup.py build_ext --inplace

LD_LIBRARY_PATH=`pwd`/../cmath/ python test.py
