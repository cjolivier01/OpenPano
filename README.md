# OpenPano image-stitching
#### Modified by Claude Pageau

## Introduction
OpenPano is a panorama stitching program written in C++ from scratch (without any vision libraries). It mainly follows the routine
described in the paper [Automatic Panoramic Image Stitching using Invariant Features](http://matthewalunbrown.com/papers/ijcv2007.pdf),
which is also the one used by [AutoStitch](http://matthewalunbrown.com/autostitch/autostitch.html).

This is a modified version of the OpenPano project. An Output file path parameter is added.  The default program creates
a hardcoded out.jpg file name in the same directory as image-stitching executable.  This caused some issues with a Raspberry Pi
project of mine.  I also improved the help page.  

Below are brief instructions for installing on a Raspberry Pi OS, Debian Linux system.  Code can also be compiled
for other platforms per link below

For Detailed instructions for other platforms see original project at https://github.com/ppwwyyxx/OpenPano

### Quick Install: Raspberry PI, Debian or compatible UNIX distro
**IMPORTANT** - It is suggested you Run ***sudo apt-get update*** before running this
curl install script.  This script will run update just to ensure success.  Tested OK on Raspbian Buster.

***Step 1*** With mouse left button highlight curl command in code box below. Right click mouse in **highlighted** area and Copy.     
***Step 2*** On RPI putty SSH or terminal session right click, select paste then Enter to download and run script.     

    curl -L https://raw.github.com/pageauc/OpenPano/master/install.sh | bash

The command above will Install dependencies, Clone, Compile and Test this GitHub project using ***install.sh*** script. 
If OpenPano folder already exists, Install will Exit.

#### Install eigen3 if required

    curl -L https://raw.github.com/pageauc/OpenPano/master/eigen3-install.sh | bash

***IMPORTANT*** This will take some time so be patient ....

Raise a Project GitHub issue if you have problems.

### Manual Install and Compile:
#### Linux / OSX / WSL (bash on windows)

Open a desktop terminal or SSH session to the desired machine or Raspberry pi.
Run the following commands below to install, compile image-stitching.

This assumes you are comfortable with SSH/Terminal commands

#### Install and Compile OpenPano image-stitching 
```
cd ~/
sudo apt-get update
sudo apt-get install git
sudo apt-get install build-essential
sudo apt-get install cmake
sudo apt-get pkg-config
sudo apt-get install libjpeg-dev 
sudo apt-get install libtiff5-dev
sudo apt-get install libjasper-dev
sudo apt-get install libpng-dev
git clone https://github.com/pageauc/OpenPano
cd ~/OpenPano
mkdir build
cd build
cmake -S ~/OpenPano/src -B ~/OpenPano -Wno-dev
make
cp image-stitching ../
```

#### Buster and Stretch
This curl install worked with a fresh install of Buster and Stretch Compiled and Tested OK. 
#### Jessie
Jessie was running on an old single core processor. There was a problem with cmake complained about eigen3 support.
It also complained about cmake version. Had to change ~OpenPano/CMakeLists.txt and OpenPano/src/CMakeLists.txt
top line to lower version to ***cmake_minimum_required(VERSION 3.6.2)*** from 3.13. This worked except for a
minor non fatal macro warning. After cloning, compiling and installing Eigen3 per steps below I redid OpenPano
cmake and make and ***image-stitching*** test ran like a charm.
If you have cmake problems related to eigen3. You can install eigen3 support per the commands below.

#### Install Eigen3 Support
```
cd ~/
git clone https://github.com/libigl/eigen
cd eigen
mkdir build
cd build
cmake ..
make
sudo make install
```
***Notice there are two periods after cmake***    
If eigen3 installed OK, then rerun OpenPano cmake steps per previous instructions above.
You should be good to go. If necessary you can run a ***make clean*** and retry cmake and make.

Compile will generate an executable file called ***image-stitching*** in ~/OpenPano or possibly
~/OpenPano/src folder. Check to make sure there is a config.cfg file in the same folder as image-stitching
per manual terminal instructions below.

There are three test jpg files in the ~/OpenPano/images folder. To Test image-stitching
perform the following commands

#### Run a Test Stitch
```
cd ~/OpenPano
cp src/config.cfg ./
./image-stitching
chmod +x test-pano.sh
./test-pano.sh
``` 
 
***Note*** You may want to copy the image_stitching and config.cfg to a production or working folder.

example commands to create a stitch folder for working with OpenPano.

```
cd ~/
mkdir stitch
cd stitch
cp ~/OpenPano/image-stitching ./
cp ~/OpenPano/config.cfg ./
mkdir images
mkdir panos
cp ~/OpenPano/images/* images
./image-stitching panos/first_pano.jpg images/img1.jpg images/img2.jpg images/img3.jpg 
ls images
```
If you like you can then remove the OpenPano folder
```
cd ~/
sudo rm -r OpenPano
```
Hope this helps
 
### Run:
To display program help run ./image-stitching with no parameters

```
./image-stitching

./image-stitching version 0.6

Creates a stitched panoramic image from two or more overlapping images.

usage

./image-stitching <outfn> <infn> <infn> .....
where <outfn> : Output file path for pano stitch image file. Must incl .jpg or .png ext
      <infn>  : Input file path to Two or More existing overlapping images.

examples

   ./image-stitching ./img_pano.jpg ./img_1.jpg ./img_2.jpg
   ./image-stitching ./panos/pano_1.jpg ./images/img_1.jpg ./images/img_2.jpg ./images/img_3.jpg
   ./image-stitching ./media/mypanos/pano_1021.jpg ./media/TL/rpi-1_1021.jpg ./media/TL/rpi-2_1021.jpg

notes

- Valid config.cfg file needs to be in same dir as this program.
- Output image file directory path must exist. filename will be created or overwritten if it exists.
- Input image file paths must exist.
- This OpenPano project version is modified by Claude Pageau to Add Output Parameter.
- For original project details see https://github.com/ppwwyyxx/OpenPano

```

### Notes:

I am working on a raspberry pi python project to take timelapse images on multiple RPI's at the same time. Images are automatically
sent using imageZMQ to a RPI running the hub program (can run on one of the sending pi's). 
Images are saved to disk with a common sequence number naming.  When all images in a set are received 
they are stitched and saved to a pano folder with the seqence number as part of the file naming.

I currently have three RPI camera's running the pano timelapse in real time.  
The test image files are of our computer/sewing room
but I plan to move to other locations.
I had to design and build a simple but sturdy mounting for each RPI using wood and foam board.  
This allows accurate camera positioning since image-stitching 
requires accurate horizontal image overlap. Images also have to align vertically.
Getting multiple camera's aligned is much easier with my camera support system.

Will publish this project and leave a link here when posted on github. 

