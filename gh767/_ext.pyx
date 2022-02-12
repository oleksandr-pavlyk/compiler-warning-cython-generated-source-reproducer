# cython: linetrace=True

from libc.math cimport sin, cos

cpdef double sin_squared(double x):
    return sin(x * x)

cpdef double cos_squared(double x):
    return cos(x * x)

cdef class SyclAsynchronousError(Exception):
    """
    A SyclAsynchronousError exception is raised when SYCL operation submission
    or execution encounters an error.
    """

cdef void default_async_error_handler(int err) nogil except *:
    with gil:
        raise SyclAsynchronousError(err)


cpdef doit(int err):
    default_async_error_handler(err)
