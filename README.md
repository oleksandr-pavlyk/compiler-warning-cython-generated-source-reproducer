# Small reproducer for IntelPython/dpctl#767

Create environment with the following packages:
   - python
   - cython
   - setuptools

Build project:

```bash
python setup.py build
```

The output I see:

```
(idp_2022) [13:54:15 ansatnuc04 gh_767]$ python setup.py build
running build
running build_ext
cythoning gh767/_ext.pyx to gh767/_ext.c
building 'gh767._ext' extension
creating build
creating build/temp.linux-x86_64-3.9
creating build/temp.linux-x86_64-3.9/gh767
gcc -pthread -B ~/.conda/envs/idp_2022/compiler_compat -Wno-unused-result -Wsign-compare -DNDEBUG -fwrapv -O2 -Wall -Wformat -Wformat-security -fstack-protector-all -D_FORTIFY_SOURCE=2 -fpic -fPIC -O2 -Wl,-z,noexecstack,-z,relro,-z,now,-rpath,$ORIGIN/../..,-rpath,$ORIGIN/../../.. -I~/.conda/envs/idp_2022/include -Wformat -Wformat-security -fstack-protector-all -D_FORTIFY_SOURCE=2 -fpic -fPIC -O2 -Wl,-z,noexecstack,-z,relro,-z,now,-rpath,$ORIGIN/../..,-rpath,$ORIGIN/../../.. -fPIC -DCYTHON_TRACE_NOGIL=1 -DCYTHON_TRACE=1 -I~/.conda/envs/idp_2022/include/python3.9 -c gh767/_ext.c -o build/temp.linux-x86_64-3.9/gh767/_ext.o
gh767/_ext.c: In function ‘__pyx_pw_5gh767_4_ext_1handler’:
gh767/_ext.c:836:34: warning: ‘__pyx_gilstate_save’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  836 | #define __Pyx_PyGILState_Release PyGILState_Release
      |                                  ^~~~~~~~~~~~~~~~~~
gh767/_ext.c:1829:20: note: ‘__pyx_gilstate_save’ was declared here
 1829 |   PyGILState_STATE __pyx_gilstate_save;
      |                    ^~~~~~~~~~~~~~~~~~~
creating build/lib.linux-x86_64-3.9
creating build/lib.linux-x86_64-3.9/gh767
gcc -pthread -B ~/.conda/envs/idp_2022/compiler_compat -shared -L~/.conda/envs/idp_2022/lib -Wl,-z,noexecstack,-z,relro,-z,now,-rpath,$ORIGIN/../..,-rpath,$ORIGIN/../../.. -L~/.conda/envs/idp_2022/lib -L~/.conda/envs/idp_2022/lib -Wl,-z,noexecstack,-z,relro,-z,now,-rpath,$ORIGIN/../..,-rpath,$ORIGIN/../../.. build/temp.linux-x86_64-3.9/gh767/_ext.o -o build/lib.linux-x86_64-3.9/gh767/_ext.cpython-39-x86_64-linux-gnu.so
```

The warning requires compiling with `-DCYTHON_TRACE_NOGIL=1`.