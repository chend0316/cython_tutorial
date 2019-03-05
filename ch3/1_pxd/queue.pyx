cimport cqueue

# 类叫做Queue，不怕和C的Queue结构体名字冲突了
cdef class Queue:
    cdef cqueue.Queue *_c_queue

    def __cinit__(self):
        self._c_queue = cqueue.queue_new()

    def __dealloc__(self):
        if self._c_queue is not NULL:
            cqueue.queue_free(self._c_queue)
