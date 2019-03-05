#file: queue.pyx

from cpython.ref cimport PyObject

cdef extern from "queue.h":
    ctypedef struct Queue:
        pass
    ctypedef void *QueueValue

    Queue *queue_new()
    void queue_free(Queue *queue)
    int queue_push_tail(Queue *queue, QueueValue data)
    QueueValue queue_pop_tail(Queue *queue)

def foo():
    # 虽然没有实际意义，但这段代码很自嗨，可以看到Cython中完全可以调用C函数
    cdef Queue *q
    q = queue_new()
    queue_free(q)

cdef class PyQueue:
    cdef Queue *_c_queue

    def __cinit__(self):
        self._c_queue = queue_new()
        if self._c_queue == NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_queue is not NULL:
            queue_free(self._c_queue)

    def push_tail(self, v):
        if (queue_push_tail(self._c_queue, <void*>v) != 0):
            (<PyObject*>v).ob_refcnt += 1
        else:
            raise MemoryError()

    def pop_tail(self):
        cdef QueueValue v
        v = queue_pop_tail(self._c_queue)
        if v != NULL:
            obj = <object>v
            (<PyObject*>obj).ob_refcnt -= 1
            return obj
        else:
            return None
