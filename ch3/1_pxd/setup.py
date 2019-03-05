from distutils.core import setup, Extension
from Cython.Build import cythonize

extension = Extension(
    "queue",
    ["queue.pyx"],
    libraries=["cqueue"]
)

setup(
    ext_modules=cythonize([extension])
)
