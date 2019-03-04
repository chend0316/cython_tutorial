from distutils.core import setup, Extension
from Cython.Build import cythonize

extension = Extension(
    "pymath",
    ["pymath.pyx"],
    libraries=["cmath"]
)

setup(
    ext_modules=cythonize([extension])
)
