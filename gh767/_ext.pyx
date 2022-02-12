# cython: language_level=3
# cython: linetrace=True

cdef class MyError(Exception):
    """
    An  exception is raised when operation submission
    or execution encounters an error.
    """

cdef void default_async_error_handler(int err) nogil except *:
    with gil:
        raise MyError(err)

def handler(int err):
    if (err % 2):
        with nogil:
            default_async_error_handler(err)
    else:
        print("All good")
