cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DMAKE_TEST=NO \
      -DMAKE_PYTHON_BINDINGS=ON \
      .
make install