from libc.math cimport sin
from libc.stdlib cimport atof

def foo(char *s):
    x = atof(s)
    return sin(x)
