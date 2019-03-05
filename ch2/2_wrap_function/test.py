import queue

q = queue.PyQueue()
q.push_tail('a')
q.push_tail(123)
q.push_tail({'name': 'zhang', 'age': 18})
print(q.pop_tail())
print(q.pop_tail())
print(q.pop_tail())
