from setuptools import setup, Extension

setup(
    name="gh767",
    version="0.0.1.dev0",
    description="A sample project to reproduce IntelPython/dpctl#767",
    license="Apache 2.0",
    ext_modules=[
        Extension(
            name="gh767._ext",
            sources=["gh767/_ext.pyx"],
            define_macros=[("CYTHON_TRACE_NOGIL", 1), ("CYTHON_TRACE",1),],
        ),
    ],
)
