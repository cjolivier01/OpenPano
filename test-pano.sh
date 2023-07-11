#!/bin/bash
set -e
echo "Testing image-stitching"
#cd ~/OpenPano
echo "Running"
echo "./image-stitching ./images/test-pano.jpg ./images/img1.jpg ./images/img2.jpg ./images/img3.jpg"
./image-stitching ./images/test-pano.jpg ./images/img1.jpg ./images/img2.jpg ./images/img3.jpg
echo "Final stitched image test-pano.jpg will be in images folder"
ls images
echo "Exit Test"
