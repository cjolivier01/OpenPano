#!/bin/bash
# install bash script for https://github.com/pageauc/OpenPano project
# written by Claude Pageau  rev 1

echo "-- Clone and Compile https://github.com/pageauc/OpenPano project"
echo "-- This is suitable for RPI or Debian"
cd ~/
if [ -d OpenPano ]; then
    echo "OpenPano folder already exists"
    echo "and may already be cloned"
    echo "If you want to do a fresh install"
    echo "Rename or Delete the existing OpenPano Folder"
    echo "eg."
    echo "    mv OpenPano OpenPanobak"
    echo "or  sudo rm -r OpenPano"
    exit 1
fi

echo "-- Running sudo apt-get update"
echo "-- This might take a bit of time but will better ensure a successful compile"
sudo apt-get -y update
echo "-- Running sudo apt-get install git"
sudo apt-get -y install git
echo "-- Running sudo apt-get install build-essentials, cmake, pkg-config and jpeg lsdependencies"
echo "-- This might take some time ..."
sudo apt-get -y install build-essential
sudo apt-get -y install cmake
sudo apt-get -y install pkg-config
sudo apt-get -y install libjpeg-dev
sudo apt-get -y install libtiff5-dev
sudo apt-get -y install libjasper-dev
sudo apt-get -y install libpng-dev
echo "-- Running git clone https://github.com/pageauc/OpenPano"
echo "-- This will take some time ..."
git clone https://github.com/pageauc/OpenPano
if [ ! -d OpenPano ]; then
    echo "-- ERROR: OpenPano Folder Not Found. git failed for some reason."
    echo "--        Investigate problem.  Could be internet communications"
    exit 1
fi
cd ~/OpenPano
echo "-- Running cmake from OpenPano Directory"
cmake -S ~/OpenPano/src -B ~/OpenPano -Wno-dev
echo "-- Running make to compile image-stitching from source"
echo "-- This will take some time ...."
make
if [ -f image-stitching ]; then
    cp image-stitching ../
else
    echo "-- Cannot find image stitching in build folder."
fi
echo "-- Running cp src/config.cfg ./"
echo "-- Show image-stitching command Help"
./image-stitching
echo "-- Running test-pano.sh"
chmod +x test-pano.sh
./test-pano.sh
ls ./images
if [ -f images/test-pano.jpg ]; then
    echo "-- Success. Found stitch output images/test-pano.jpg"
    echo "-- To check OpenPano project"
    echo "-- cd OpenPano"
else
    echo "-- Failed. images/test-pano.jpg file Not Found"
    echo "-- Please Investigate."
fi
echo "-- Install and Test Complete"
echo "-- Bye ..."