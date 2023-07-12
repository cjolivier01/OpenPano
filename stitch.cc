// CPP program to Stitch
// input images (panorama) using OpenCV
#include <iostream>
#include <fstream>

// Include header files from OpenCV directory
// required to stitch images.
#include "opencv2/imgcodecs.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/stitching.hpp"

#ifdef DISABLE_JPEG
#define IMGFILE(x) #x ".png"
#else
#define IMGFILE(x) #x ".jpg"
#endif

using namespace std;
using namespace cv;

// Define mode for stitching as panorama
// (One out of many functions of Stitcher)
cv::Stitcher::Mode mode = cv::Stitcher::PANORAMA;

// Array for pictures
vector<cv::Mat> imgs;

int main(int argc, char* argv[])
{
    // Get all the images that need to be
    // stitched as arguments from command line
    for (int i = 1; i < argc; ++i)
    {
            // Read the ith argument or image
            // and push into the image array
            Mat img = imread(argv[i]);
            if (img.empty())
            {
                // Exit if image is not present
                cout << "Can't read image '" << argv[i] << "'\n";
                return -1;
            }
            imgs.push_back(img);
    }

    // Define object to store the stitched image
    Mat pano;

    // Create a Stitcher class object with mode panoroma
    Ptr<cv::Stitcher> stitcher = cv::Stitcher::create(mode);

    // Command to stitch all the images present in the image array
    cv::Stitcher::Status status = stitcher->stitch(imgs, pano);

    if (status != cv::Stitcher::OK)
    {
        // Check if images could not be stitched
        // status is OK if images are stitched successfully
        cout << "Can't stitch images\n";
        return -1;
    }

    // Store a new image stitched from the given
    //set of images as "result.jpg"
    imwrite("result.jpg", pano);

    // Show the result
    imshow("Result", pano);

    waitKey(0);
    return 0;
}

