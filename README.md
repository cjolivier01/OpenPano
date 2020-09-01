# OpenPano

## Introduction
OpenPano is a panorama stitching program written in C++ from scratch (without any vision libraries). It mainly follows the routine
described in the paper [Automatic Panoramic Image Stitching using Invariant Features](http://matthewalunbrown.com/papers/ijcv2007.pdf),
which is also the one used by [AutoStitch](http://matthewalunbrown.com/autostitch/autostitch.html).

This is a modified version of the OpenPano project. An Output file path parameter is added.  The default program produced
an out.jpg file in the same directory as image-stitching executable.  This caused some issues with a Raspberry Pi
project of mine.  I also improved the help page.  

Below are brief instructions for installing on a Raspberry Pi OS, Debian Linux system.

For Detailed instructions for other platforms see original project at https://github.com/ppwwyyxx/OpenPano

### Install and Compile:
#### Linux / OSX / WSL (bash on windows)

```
cd ~/
sudo apt-get update
sudo apt-get install build-essential
git clone https://github.com/pageauc/OpenPano
cd ~/OpenPano
makedir build
cd build
cmake ..
make
```

Executable file called image-stitching will be in ~/OpenPano directory
Check to make sure there is a config.cfg file in the same folder as image-stitching
 
### Run:

```
$ ./image-stitching <outfile> <infile1> <infile2> ...
```

run ./image-stitching with no parameters to see program help and examples


