from distutils.core import setup, Extension
from Cython.Build import cythonize

extension = Extension(
    "demo",
    ["demo.pyx"],
)

setup(
    ext_modules=cythonize([extension])
)
