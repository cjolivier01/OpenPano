#!/bin/bash
# install bash script for https://github.com/pageauc/OpenPano project
# written by Claude Pageau  rev 1

echo "Clone and Compile https://github.com/pageauc/OpenPano project"
echo "This is suitable for RPI or Debian"
cd ~/
if [ -d OpenPano ]; then
    echo "OpenPano folder already exists"
    echo "and may already be cloned"
    echo "If you want to do a fresh install"
    echo "Rename or Delete the existing OpenPano Folder"
    echo "eg."
    echo "    mv OpenPano OpenPanobak"
    echo "or  rm -r OpenPano"
    read -p "Press enter to continue"
    exit 1
fi    

echo "Running sudo apt-get install git"
sudo apt-get -y install git
echo "Running sudo apt-get install build-essential"
echo "This might take some time ..."
sudo apt-get -y install build-essential
echo "Running git clone https://github.com/pageauc/OpenPano"
echo "This will take some time ..."
git clone https://github.com/pageauc/OpenPano
if [ ! -d OpenPano ]; then
    echo "ERROR: OpenPano Folder Not Found. git failed for some reason."
    echo "       Investigate problem.  Could be internet communications"
    read -p "Press enter to continue"
    exit 1
fi
cd ~/OpenPano   
echo "Running cmake src from OpenPano Directory"
cmake src
echo "Running make to compile image-stitching from source"
echo "This will take take some time ...."
make
echo "Running cp src/config.cfg ./"
cp src/config.cfg ./
echo "Show Help"
./image-stitching
echo "Running test-pano.sh"
chmod +x test-pano.sh
./test-pano.sh
ls ./images
if [ -f images/test-pano.jpg ]; then
    echo "Success. Found stitch output images/test-pano.jpg"
else
    echo "Failed. images/test-pano.jpg file Not Found"
    echo "Please Investigate."
fi
echo "Install and Test Complete"
read -p "Press enter to Exit install.sh"
echo "Bye ..."