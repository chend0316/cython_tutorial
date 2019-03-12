cdef extern from 'foo.h':
    void traverse(int *arr, int len, void (*cb)(int))
    void traverse2(int *arr, int len, void (*cb)(int, void*), void *priv)
