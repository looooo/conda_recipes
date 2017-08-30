#!/bin/bash

mkdir -p build
cd build

cmake \
    -D CMAKE_BUILD_TYPE:STRING=RELEASE \
    -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX \
    -D DAKOTA_EXAMPLES_INSTALL:PATH=$PREFIX/share/dakota \
    -D DAKOTA_TEST_INSTALL:PATH=$PREFIX/share/dakota \
    -D DAKOTA_TOPFILES_INSTALL:PATH=$PREFIX/share/dakota \
    -D DAKOTA_PYTHON=ON \
    -D DAKOTA_PYTHON_NUMPY=ON \
    -D HAVE_X_GRAPHICS=OFF \
    -D DAKOTA_HAVE_MPI=ON \
    /projects/dakota

make -j $CPU_COUNT
make install

mv $PREFIX/examples $PREFIX/share/dakota/hopspack

