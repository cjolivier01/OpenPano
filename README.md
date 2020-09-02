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

### Quick Install or Upgrade
**IMPORTANT** - It is suggested you Run ***sudo apt-get update*** before running this
curl install script.

***Step 1*** With mouse left button highlight curl command in code box below. Right click mouse in **highlighted** area and Copy.     
***Step 2*** On RPI putty SSH or terminal session right click, select paste then Enter to download and run script.     

    curl -L https://raw.github.com/pageauc/OpenPano/master/install.sh | bash

The command above will Install dependencies, Clone, Compile and Test this GitHub project using ***install.sh*** script. 
If OpenPano already exists, Install will exit.

### Install and Compile:
#### Linux / OSX / WSL (bash on windows)

Open a desktop terminal or SSH session to the desired machine or Raspberry pi.
Run the following commands below to install, compile image-stitching.

```
cd ~/
sudo apt-get update
sudo apt-get install git
sudo apt-get install build-essential
git clone https://github.com/pageauc/OpenPano
cd ~/OpenPano
cmake src
make
```

compile will generate an executable file called image-stitching.  It will be saved in the ~/OpenPano directory.
Check to make sure there is a config.cfg file in the same folder as image-stitching
per instructions below

There are some test jpg files in the images folder. To Test image-stitching
perform the following commands

```
cp src/config.cfg ./
./image-stitching
chmod +x test-pano.sh
./test-pano.sh
``` 
 
 
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

