#!/bin/bash
echo "-- OpenPano prerequiste on some computers"
echo "-- Compile and build eigen3 libraries"
cd ~/
echo "-- git clone https://github.com/libigl/eigen"
git clone https://github.com/libigl/eigen
cd eigen
mkdir build
cd build
cmake ..
make
sudo make install
echo "-- Checking for eigen3 version"
pkg-config --modversion eigen3
echo "-- if version number displayed then eigen3 is installed"
echo "-- Bye"