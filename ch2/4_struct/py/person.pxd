from libc.stdlib cimport malloc, free

cdef extern from "person.h":
    ctypedef struct person_t:
        int age
        char *name

    void person_say_hello(person_t *p)

cdef class Person:
    cdef person_t *__ptr
