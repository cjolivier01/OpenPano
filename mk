GL_PATH=/snap/gnome-42-2204/120/usr/lib/x86_64-linux-gnu

#  -I/home/colivier/.conda/envs/dojo-dev-86d90e46c18b/include/opencv4

g++ \
  -I/usr/include/opencv4 \
  stitch.cc \
  -o stitch \
  -lc \
  -L${GL_PATH} \
  -lGL \
  -lopencv_ml \
  -lopencv_objdetect \
  -lopencv_stitching \
  -lopencv_core \
  -lopencv_shape \
  -lopencv_highgui \
  -lopencv_imgcodecs \
  -lopencv_videoio \
  -lX11 \
  -lXext \
  -lGL \
  -lm \
  -ldl \
  -lrt

  # -L/home/colivier/.conda/envs/dojo-dev-86d90e46c18b/lib \
  # -L/home/colivier/.conda/envs/dojo-dev-86d90e46c18b/x86_64-conda-linux-gnu/sysroot/usr/lib64/ \
  # /home/colivier/.conda/envs/dojo-dev-86d90e46c18b/x86_64-conda-linux-gnu/sysroot/usr/lib64/librt.so
  # /home/colivier/.conda/envs/dojo-dev-86d90e46c18b/x86_64-conda-linux-gnu/sysroot/usr/lib64/libdl.so






