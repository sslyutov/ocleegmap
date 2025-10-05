#define CL_TARGET_OPENCL_VERSION 120
#include <CL/cl.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    cl_int err;
    cl_uint numPlatforms;
    cl_platform_id platform = NULL;

    // Get the number of platforms
    err = clGetPlatformIDs(0, NULL, &numPlatforms);
    if (err != CL_SUCCESS || numPlatforms == 0) {
        printf("No OpenCL platforms found.\n");
        return 1;
    }

    // Get the first available platform
    cl_platform_id* platforms = (cl_platform_id*)malloc(sizeof(cl_platform_id) * numPlatforms);
    clGetPlatformIDs(numPlatforms, platforms, NULL);
    platform = platforms[0];
    free(platforms);

    // Get platform name
    char platformName[128];
    clGetPlatformInfo(platform, CL_PLATFORM_NAME, sizeof(platformName), platformName, NULL);
    printf("OpenCL Platform: %s\n", platformName);

    // Get device info
    cl_uint numDevices;
    cl_device_id device;
    err = clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, 1, &device, &numDevices);
    if (err != CL_SUCCESS) {
        printf("Failed to get device.\n");
        return 1;
    }

    char deviceName[128];
    clGetDeviceInfo(device, CL_DEVICE_NAME, sizeof(deviceName), deviceName, NULL);
    printf("OpenCL Device: %s\n", deviceName);

    return 0;
}
