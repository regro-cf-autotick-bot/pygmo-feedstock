#!/usr/bin/env bash

mkdir build
cd build
export PYGMO_BUILD_DIR=`pwd`

git clone https://github.com/pybind/pybind11.git
git checkout 4f72ef846fe8453596230ac285eeaa0ce3278bb4
cd pybind11
mkdir build
cd build
pwd
cmake \
    -DPYBIND11_TEST=NO \
    -DCMAKE_INSTALL_PREFIX=$PYGMO_BUILD_DIR \
    -DCMAKE_PREFIX_PATH=$PYGMO_BUILD_DIR \
    ..
make install
cd ../..

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_CXX_STANDARD=$CPP_STANDARD \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    ..

make

make install
