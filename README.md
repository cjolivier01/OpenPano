# OpenPano

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

### Install and Compile:
#### Linux / OSX / WSL (bash on windows)

```
cd ~/
sudo apt-get update
sudo apt-get git
sudo apt-get install build-essential
git clone https://github.com/pageauc/OpenPano
cd ~/OpenPano
makedir build
cd build
cmake ..
make
```

Executable file called image-stitching will be created in the ~/OpenPano directory.
Check to make sure there is a config.cfg file in the same folder as image-stitching
 
### Run:
To display program help run image-stitching with no parameters


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




