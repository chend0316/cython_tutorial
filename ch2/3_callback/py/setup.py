from distutils.core import setup, Extension
from Cython.Build import cythonize

extension = Extension(
    "foo",
    ["foo.pyx"],
    libraries=["foo"]
)

setup(
    ext_modules=cythonize([extension])
)
