#!/bin/bash
echo "OpenPano prerequiste on some computers"
echo "Compile and build eigen3 libraries"
cd ~/
echo "git clone https://github.com/libigl/eigen"
git clone https://github.com/libigl/eigen
cd eigen
mkdir build
cd build
cmake ..
make
sudo make install
echo "eigen3 should be installed"
echo "Bye"