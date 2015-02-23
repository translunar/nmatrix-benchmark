nmatrix-benchmark
=================

Benchmark tools for NMatrix

## Requirements

On Debian based distributions you will need:

    apt-get install libatlas3-base

In case that `ld` won't find your libraries:

    /usr/bin/ld: cannot find -llapack
    /usr/bin/ld: cannot find -lcblas
    /usr/bin/ld: cannot find -latlas

you can fix it with:

    ln -s /usr/lib/liblapack.so.3 /usr/lib/liblapack.so
    ln -s /usr/lib/libcblas.so.3 /usr/lib/libcblas.so
    ln -s  /usr/lib/libatlas.so.3  /usr/lib/libatlas.so
