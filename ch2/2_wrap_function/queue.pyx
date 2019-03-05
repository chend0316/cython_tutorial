#file: queue.pyx

cdef extern from "queue.h":
    ctypedef struct Queue:
        pass
    ctypedef void *QueueValue

    Queue *queue_new()
    void queue_free(Queue *queue)

def foo():
    # 虽然没有实际意义，但这段代码很自嗨，可以看到Cython中完全可以调用C函数
    cdef Queue *q
    q = queue_new()
    queue_free(q)

cdef class PyQueue:
    cdef Queue *_c_queue

    def __cinit__(self):
        self._c_queue = queue_new()

    def __dealloc__(self):
        if self._c_queue is not NULL:
            queue_free(self._c_queue)
