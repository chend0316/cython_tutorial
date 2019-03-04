#!/bin/sh

set -xe

gcc -fPIC -shared -g cmath.c -o libcmath.so

# -2选项不是很重要，也可以省略，请不要太在意，感兴趣用`cython -help`看看啥意思
cython -2 pymath.pyx

# 由于这里引用的是python3.6的头文件，所以编译出来的so只能给python3使用
gcc -fPIC -shared ./pymath.c -o pymath.so -I/usr/include/python3.6/ -L./ -lcmath
LD_LIBRARY_PATH=`pwd` python3 test.py  # 只能用python3执行，不能用python执行

rm ./pymath.so
# 由于这里引用的是python2.7的头文件，所以编译出来的so只能给python2使用
gcc -fPIC -shared ./pymath.c -o pymath.so -I/usr/include/python2.7/ -L./ -lcmath
LD_LIBRARY_PATH=`pwd` python test.py  # 只能用python执行，不能用python3执行
