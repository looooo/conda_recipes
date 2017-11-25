mkdir build
cd build

cmake -G "MSYS Makefiles" ^
    -D CMAKE_BUILD_TYPE:STRING=RELEASE ^
    -D CMAKE_INSTALL_PREFIX:PATH=%PREFIX% ^
    -D DAKOTA_PYTHON=OFF ^
    -D DAKOTA_PYTHON_NUMPY=OFF ^
    -D HAVE_X_GRAPHICS=OFF ^
    -D DAKOTA_HAVE_MPI=ON ^
    "C:\Users\fc_builder\projects\dakota"


if errorlevel 1 exit 1
make
if errorlevel 1 exit 1