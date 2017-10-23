#!/bin/bash

mkdir -p build
cd build

cmake \
    -D CMAKE_BUILD_TYPE:STRING=RELEASE \
    -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX \
    -D HAVE_X_GRAPHICS=OFF \
    -D DAKOTA_HAVE_MPI=ON \
    -D DAKOTA_PYTHON=ON \
    /projects/dakota

make -j $CPU_COUNT
make install


