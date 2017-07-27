#!/bin/bash

mkdir -p build
cd build

# env LDFLAGS="-L/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/lib/ $LDFLAGS" \
cmake \
    -D CMAKE_BUILD_TYPE:STRING=RELEASE \
    -D CMAKE_VERBOSE_MAKEFILE:BOOL=FALSE \
    -D DART_TESTING_TIMEOUT:STRING=600 \
    -D Trilinos_ENABLE_Fortran:BOOL=OFF \
    -D Trilinos_ENABLE_TESTS:BOOL=OFF \
    -D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
    -D Trilinos_ENABLE_PyTrilinos:BOOL=ON \
    -D Trilinos_ENABLE_Epetra:BOOL=ON \
    -D Trilinos_ENABLE_EpetraExt:BOOL=ON \
    -D Trilinos_ENABLE_AztecOO:BOOL=ON \
    -D Trilinos_ENABLE_ML:BOOL=ON \
    -D Trilinos_ENABLE_STK:BOOL=OFF \
    -D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=xON \
    -D TPL_ENABLE_MPI:BOOL=ON \
    -D TPL_ENABLE_Netcdf=OFF \
    -D MPI_BASE_DIR:PATH=${PREFIX} \
    -D BUILD_SHARED_LIBS:BOOL=ON \
    -D SWIG_EXECUTABLE:FILEPATH=$PREFIX/bin/swig \
    -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D PYTHON_EXECUTABLE:FILEPATH=$PREFIX/bin/python${PY_VER} \
    -D PYTHON_INCLUDE_PATH:PATH=$PREFIX/include/python${PY_VER} \
    -D PYTHON_LIBRARY:FILEPATH=$PREFIX/lib/libpython${PY_VER}${SHLIB_EXT} \
    -D PyTrilinos_INSTALL_PREFIX:PATH=$PREFIX \
    -D BLAS_LIBRARY_DIRS=${PREFIX}/lib \
    -D BLAS_LIBRARY_NAMES="openblas;libgfortran.so" \
    -D LAPACK_LIBRARY_DIRS=${PREFIX}/lib \
    -D LAPACK_LIBRARY_NAMES="openblas" \
    ..

make -j $CPU_COUNT
make install

# because of wrong linking:
rm -rf ${PREFIX}/lib/cmake/tribits/doc/developers_guide/TribitsBuildReference.html