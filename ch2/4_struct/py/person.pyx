
cdef class Person:
    def __cinit__(self):
        self.__ptr = <person_t*>malloc(sizeof(person_t))

    def __dealloc__(self):
        free(self.__ptr)

    @property
    def age(self):
        return self.__ptr.age
    
    @age.setter
    def age(self, value):
        self.__ptr.age = value

    @property
    def name(self):
        return self.__ptr.name

    @name.setter
    def name(self, value):
        self.__ptr.name = value

    def say_hello(self):
        person_say_hello(self.__ptr)
