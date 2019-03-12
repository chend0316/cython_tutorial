import foo

def cb(a):
    print(a*a)

foo.traverse([1, 2, 3], cb)

def cb2(a, priv):
    print(priv + str(a))

foo.traverse2([4, 5, 6], cb2, 'hello: ')
