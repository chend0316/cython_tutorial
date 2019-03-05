#file: queue.pxd

cdef extern from "queue.h":
    ctypedef struct Queue:
        pass
    ctypedef void *QueueValue

    Queue *queue_new()
    void queue_free(Queue *queue)
