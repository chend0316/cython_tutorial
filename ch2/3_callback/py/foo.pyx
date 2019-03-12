from cfoo cimport traverse as c_traverse
from cfoo cimport traverse2 as c_traverse2
from libc.stdlib cimport malloc, free

app_cb = None

cdef void traverse_cb(int a):
    global app_cb
    app_cb(a)

def traverse(arr, cb):
    global app_cb
    cdef int *c_arr = <int*>malloc(n_arr * sizeof(int))
    cdef int n_arr = len(arr)
    for i in range(n_arr):
        c_arr[i] = arr[i]
    app_cb = cb
    c_traverse(c_arr, n_arr, traverse_cb)
    free(c_arr)

cdef void traverse2_cb(int a, void *priv):
    wrap_priv = <object>priv
    cb = wrap_priv['cb']
    p = wrap_priv['p']
    cb(a, p)

def traverse2(arr, cb, priv):
    global app_cb
    cdef int *c_arr
    cdef int n_arr

    n_arr = len(arr)
    c_arr = <int*>malloc(n_arr * sizeof(int))
    for i in range(n_arr):
        c_arr[i] = arr[i]
    wrap_priv = {'cb': cb, 'p': priv}
    c_traverse2(c_arr, n_arr, traverse2_cb, <void*>wrap_priv)
    free(c_arr)
