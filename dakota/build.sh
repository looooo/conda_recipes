#!/bin/bash

mkdir -p build
cd build

cmake \
    -D CMAKE_BUILD_TYPE:STRING=RELEASE \
    -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX \
    -D HAVE_X_GRAPHICS=OFF \
    -D BUILD_IN_TRILINOS=OFF \
    /projects/dakota

make -j $CPU_COUNT
make install


