# find all dependency libraries:
cmake_minimum_required(VERSION 3.1)
project (OpenPano LANGUAGES CXX)
find_package(OpenMP)
if (NOT OPENMP_FOUND)
	message(WARNING "OpenMP is not found. Will be slow.")
else()
	set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()

add_compile_options(-Wl,--unresolved-symbols=ignore-in-shared-libs)
#add_link_options(--unresolved-symbols=ignore-in-shared-libs)

find_package(JPEG)
if(JPEG_FOUND)
	include_directories(${JPEG_INCLUDE_DIR})
endif()

find_package(Eigen3 REQUIRED)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/third-party/)

add_definitions(${EIGEN3_DEFINITIONS})
include_directories(${EIGEN3_INCLUDE_DIRS})

# find sources
file(GLOB SOURCES feature/*.cc stitch/*.cc lib/*.cc)


add_library(openpano ${SOURCES})	# TODO shared?
target_link_libraries(openpano ${JPEG_LIBRARY} lodepng)

add_executable(image-stitching main.cc)
target_link_libraries(image-stitching openpano)

# find_package(OpenGL REQUIRED)
# include_directories( ${OpenGL_INCLUDE_DIRS} )
# target_link_libraries( image-stitching ${OpenGL_LIBS} )
#target_link_libraries(image-stitching)

find_package(OpenCV REQUIRED)
include_directories( ${OpenCV_INCLUDE_DIRS} )
target_link_libraries( image-stitching ${OpenCV_LIBS} )

if (NOT JPEG_FOUND)
	target_compile_definitions(openpano PUBLIC DISABLE_JPEG)
	target_compile_definitions(image-stitching PUBLIC DISABLE_JPEG)
endif()

find_package(PythonLibs)
if(PYTHONLIBS_FOUND AND BUILD_SHARED_LIBS)
	add_library(pyopenpano SHARED python/pybind.cc)
	target_link_libraries(pyopenpano openpano pybind11)
	target_include_directories(pyopenpano SYSTEM
		PRIVATE ${PYTHON_INCLUDE_DIRS}
	)
endif()
