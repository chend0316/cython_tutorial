cdef extern from "cmath.h":
    int add(int a, int b)

def pyadd(int a, int b):
    return add(a, b)
