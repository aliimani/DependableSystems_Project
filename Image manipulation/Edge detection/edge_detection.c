#include "edge_detection.h"
#include "array_utility.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

float*** apply_Laplacian_of_Gaussian (float*** input, int M_in, int N_in,
    float threshold, int square_size)
{
    // Declare output.
    float** intermediate = alloc2df(M_in, N_in);
    float*** output = alloc3df(3, M_in, N_in);

    // Define the Laplacian of Gaussian kernel.
    float** kernel = alloc2df(5, 5);
    kernel[0][0] = 0;  kernel[0][1] = 0; kernel[0][2] = 1; kernel[0][3] = 0;
        kernel[0][4] = 0;
    kernel[1][0] = 0;  kernel[1][1] = 1; kernel[1][2] = 2; kernel[1][3] = 1;
        kernel[1][4] = 0;
    kernel[2][0] = 1;  kernel[2][1] = 2; kernel[2][2] = -16; kernel[2][3] = 2;
        kernel[2][4] = 1;
    kernel[3][0] = 0;  kernel[3][1] = 1; kernel[3][2] = 2; kernel[3][3] = 1;
        kernel[3][4] = 0;
    kernel[4][0] = 0;  kernel[4][1] = 0; kernel[4][2] = 1; kernel[4][3] = 0;
        kernel[4][4] = 0;

    int i, j, k, l, m;
    for (k = 0; k < 3; k++) {
        // Find the pixel matrix for each pixel, multiply that matrix with the one
        // above, and set the array combination of the two equal to the currently
        // processed pixel.
        for (i = 0; i < M_in; i++) {
            for (j = 0; j < N_in; j++) {
                float** pixelMatrix = find_pixel_matrix(input[k], M_in, N_in,
                    i, j, 5);
                float newValue = convolve_matrices(pixelMatrix, kernel, 5);
                intermediate[i][j] = newValue;
            }
        }

        // Find zerocrossings and eliminate noise (given pseudocode).
        for (i = 0; i < M_in - square_size; i++) {
            for (j = 0; j < N_in - square_size; j++) {
                float min = 9e9;
                float max = -min;

                for (m = 0; m < square_size; m++) {
                    for (l = 0; l < square_size; l++) {
                        float w = intermediate[i+m][j+l];
                        if (w < min) {
                            min = w;
                        }

                        if (w > max) {
                            max = w;
                        }
                    }
                }

                if (min < -threshold && max > threshold) {
                    output[k][i][j] = 254;
                } else {
                    output[k][i][j] = 0;
                }
            }
        }
    }

    return output;
}

float*** detect_edges (float*** input, int M_in, int N_in)
{
    printf("Applying a series of steps to detect edges in this image...\n");
    float*** lowpass_filtered = lowpass_filter(input, M_in, N_in);
    float*** linearly_stretched = min_max_stretch(lowpass_filtered, M_in, N_in, 0.50);
    float*** square_median_filtered = square_median_filter(linearly_stretched, M_in, N_in);
    float*** laplacian_of_gaussian =
        apply_Laplacian_of_Gaussian(square_median_filtered, M_in, N_in, 1, 3);

    dealloc3df(lowpass_filtered, 3, M_in, N_in);
    dealloc3df(linearly_stretched, 3, M_in, N_in);
    dealloc3df(square_median_filtered, 3, M_in, N_in);

    return laplacian_of_gaussian;
}

//Kernel filter...

// Array addition.
float** add (float** arrayOne, float** arrayTwo, int row, int col)
{
    int i, j;
    float** final = alloc2df(row, col);
    for (i = 0; i < row; i++) {
        for (j = 0; j < col; j++) {
            final[i][j] = arrayOne[i][j] + arrayTwo[i][j];
        }
    }

    return final;
}

// Array subtraction.
float** subtract (float** arrayOne, float** arrayTwo, int row, int col)
{
    int i, j;
    float** final = alloc2df(row, col);
    for (i = 0; i < row; i++) {
        for (j = 0; j < col; j++) {
            final[i][j] = arrayOne[i][j] - arrayTwo[i][j];
        }
    }

    return final;
}

// Finds the surrounding pixel matrix in a given image.
float** find_pixel_matrix (float** input, int M_in, int N_in,
    int row, int col, int size)
{
    // Declare the pixel matrix.
    float** pixelMatrix = alloc2df(size, size);

    // Find the coordinates of the center pixel in the pixel matrix.
    int center = (int) floor((double) size / 2);

    // Fill in the surrounding edges relative to the center pixel.
    int i, j;
    for (i = 0; i < size; i++) {
        for (j = 0; j < size; j++) {
            int pixelRow = row + (i - center);
            int pixelCol = col + (j - center);

            if (pixelRow < 0) {
                pixelRow = 0;
            }

            if (pixelRow > (M_in - 1)) {
                pixelRow = M_in - 1;
            }

            if (pixelCol < 0) {
                pixelCol = 0;
            }

            if (pixelCol > (N_in - 1)) {
                pixelCol = N_in - 1;
            }

            pixelMatrix[i][j] = input[pixelRow][pixelCol];
        }
    }

    return pixelMatrix;
}

// Convolution operation between two matrices.
float convolve_matrices (float** array_one, float** array_two, int size)
{
    int i, j;
    float sum = 0;
    for (i = 0; i < size; i++) {
        for (j = 0; j < size; j++) {
            sum += array_one[i][j] * array_two[i][j];
        }
    }

    return sum;
}

// Convolution matrix filtering.
float*** convolve (float*** input, int M_in, int N_in, float** kernel, int dim)
{
    // Declare output.
    float*** output = alloc3df(3, M_in, N_in);
    int i, j, k;

    // For each channel...
    for (k = 0; k < 3; k++) {
        // Find the pixel matrix for each pixel, convolve that matrix with the
        // given kernel, and use that result to determine the new value.
        for (i = 0; i < M_in; i++) {
            for (j = 0; j < N_in; j++) {
                float** pixel_matrix = find_pixel_matrix(input[k], M_in,
                 N_in, i, j, dim);
                float new_value = convolve_matrices(pixel_matrix, kernel, dim);
                output[k][i][j] = new_value;
            }
        }
    }

    return output;
}

float*** lowpass_filter(float*** input, int M_in, int N_in)
{
    // Inform the user.
    printf("Performing a low-pass filter...\n");

    return convolve(input, M_in, N_in, lowpass_filter_3by3kernel(), 3);
}

float*** highpass_filter(float*** input, int M_in, int N_in)
{
    // Inform the user.
    printf("Performing a high-pass filter...\n");

    return convolve(input, M_in, N_in, highpass_filter_3by3kernel(), 3);
}

float** lowpass_filter_3by3kernel()
{
    float** kernel = alloc2df(3, 3);

    // Low-pass filter using 3x3 kernel.
    kernel[0][0] = (float) 1 * 1/16; kernel[0][1] = (float) 2 * 1/16;
        kernel[0][2] = (float) 1 * 1/16;
    kernel[1][0] = (float) 2 * 1/16; kernel[1][1] = (float) 4 * 1/16;
        kernel[1][2] = (float) 2 * 1/16;
    kernel[2][0] = (float) 1 * 1/16; kernel[2][1] = (float) 2 * 1/16;
        kernel[2][2] = (float) 1 * 1/16;

    return kernel;
}

float** highpass_filter_3by3kernel()
{
    // Define our 3 by 3 kernel.
    float** lpKernel = alloc2df(3, 3);
    lpKernel[0][0] = (float) 1 * 1/16; lpKernel[0][1] = (float) 2 * 1/16;
        lpKernel[0][2] = (float) 1 * 1/16;
    lpKernel[1][0] = (float) 2 * 1/16; lpKernel[1][1] = (float) 4 * 1/16;
        lpKernel[1][2] = (float) 2 * 1/16;
    lpKernel[2][0] = (float) 1 * 1/16; lpKernel[2][1] = (float) 2 * 1/16;
        lpKernel[2][2] = (float) 1 * 1/16;

    // Define our delta function kernel.
    float** deltaKernel = alloc2df(3, 3);
    deltaKernel[0][0] = (float) 0; deltaKernel[0][1] = (float) 0;
        deltaKernel[0][2] = (float) 0;
    deltaKernel[1][0] = (float) 0; deltaKernel[1][1] = (float) 1;
        deltaKernel[1][2] = (float) 0;
    deltaKernel[2][0] = (float) 0; deltaKernel[2][1] = (float) 0;
        deltaKernel[2][2] = (float) 0;

    // Subtract the latter from the former.
    return subtract(deltaKernel, lpKernel, 3, 3);
}


// Contrast enhancement...



float*** enhance_contrast (float*** input, int M_in, int N_in)
{
    int option;

    // Prompt the user.
    printf("Which histogram stretch would you like to perform? (1) for");
    printf(" a linear stretch, (2) for a 3%% min-max linear stretch.\n");
    scanf("%d", &option);

    switch (option) {
        case 2:
            printf("Performing a 3%% min-max linear stretch...");
            return min_max_stretch(input, M_in, N_in, 0.03);
        default:
            printf("Performing a linear histogram stretch...");
            return linear_stretch(input, M_in, N_in);
    }
}

float*** linear_stretch (float*** input, int M_in, int N_in)
{
    // Define output.
    float*** output = alloc3df(3, M_in, N_in);
    float** densityHistogram;

    int minColor, maxColor;
    int i, j, k;

    // Linearly stretch for all colors.
    for (k = 0; k < 3; k++) {
        // Reset necessary variables.
        minColor = 0;
        maxColor = 255;

        // Create a histogram of the input.
        densityHistogram = generate_density_histogram(input[k], 256,
            M_in, N_in);

        // Find the minimum and maximum pixel using the original histogram by
        // looping through the columns and checking for the first row that
        // has a value greater than 0.
        for (i = 0; i < 256; i++) {
            if (densityHistogram[255][i] > 0.0) {
                minColor = i + 1;
                break;
            }
        }
        for (i = 256 - 1; i > 0; i--) {
            if (densityHistogram[255][i] > 0.0) {
                maxColor = i + 1;
                break;
            }
        }

        // Create the new image with this information.
        for (i = 0; i < M_in; i++) {
            for (j = 0; j < N_in; j++) {
                // Set any pixel that has < minimum equal to zero, and set
                // any pixel that has > maximum equal to zero.
                if (input[k][i][j] < minColor) {
                    output[k][i][j] = 0;
                } else if (input[k][i][j] > maxColor) {
                    output[k][i][j] = 255;
                } else {
                    // Create the resulting pixel based on a linear scaling factor
                    // that takes into account the min and max.
                    output[k][i][j] = ((input[k][i][j] - minColor) /
                        (maxColor - minColor)) * 255;
                }
            }
        }

        free(densityHistogram);
    }

    return output;
}

float*** min_max_stretch (float*** input, int M_in, int N_in, double cutoff)
{
    // Define output.
    float*** output = alloc3df(3, M_in, N_in);
    float* density;
    float* cumulative;

    int minColor, maxColor;
    int i, j, k;
    // Linearly stretch for all three colors.
    for (k = 0; k < 3; k++) {
        minColor = 0;
        maxColor = 255;

        // Define the density and cumulative distribution functions.
        density = alloc1df(256);
        cumulative = alloc1df(256);

        // Define the weight of each pixel.
        float weight = (float) 1.0 / M_in / N_in;

        for (i = 0; i < M_in; i++) {
            for (j = 0; j < N_in; j++) {
                density[(int) input[k][i][j]] += weight;
            }
        }

        // Populate the cumulative distribution function.
        cumulative[0] = density[0];
        for (i = 1; i < 256; i++) {
            cumulative[i] += cumulative[i - 1] + density[i];
        }

        float w = 0;
        while (w < cutoff) {
            w += density[minColor++];
        }

        w = 0;
        while (w < cutoff) {
            w += density[maxColor--];
        }

        // Create the new image with this information.
        for (i = 0; i < M_in; i++) {
            for (j = 0; j < N_in; j++) {
                // Set any pixel that has < minimum equal to zero, and set
                // any pixel that has > maximum equal to zero.
                if (input[k][i][j] < minColor) {
                    output[k][i][j] = 0;
                } else if (input[k][i][j] > maxColor) {
                    output[k][i][j] = 255;
                } else {
                    // Create the resulting pixel based on a linear scaling factor
                    // that takes into account the min and max.
                    output[k][i][j] = ((input[k][i][j] - minColor) /
                        (maxColor - minColor)) * 255;
                }
            }
        }

        // Free memory.
        free(density);
        free(cumulative);
    }

    return output;
}

//Median filter

// Helper function to find the pixel array for a particular input image.
float* find_pixel_array (float** input, int M_in, int N_in,
    int row, int col, int size, int* array_size)
{
    // Declare array size.
    *array_size = size * size;

    // Declare the pixel array.
    float* array = alloc1df(*array_size);
    int index = 0;

    // Find the coordinates of the center pixel in the pixel matrix.
    int center = (int) floor((double) size / 2);

    // Fill in the surrounding edges relative to the center pixel.
    int i, j;
    for (i = 0; i < size; i++) {
        for (j = 0; j < size; j++) {
            int pixel_row = row + (i - center);
            int pixel_col = col + (j - center);

            if (pixel_row < 0) {
                pixel_row = 0;
            }

            if (pixel_row > (M_in - 1)) {
                pixel_row = M_in - 1;
            }

            if (pixel_col < 0) {
                pixel_col = 0;
            }

            if (pixel_col > (N_in - 1)) {
                pixel_col = N_in - 1;
            }

            array[index++] = input[pixel_row][pixel_col];
        }
    }

    return array;
}

// Helper function to find the cross array for a particular input image.
float* find_cross_array (float** input, int M_in, int N_in,
    int row, int col, int width, int height, int* array_size)
{
    // Declare the pixel matrix and the index on which we're currently iterating.
    *array_size = width * 2 + height * 2;
    float* cross_array = alloc1df(*array_size);
    int current_index = 0;

    // Find the horizontal elements of the cross.
    int i, j;
    for (i = 0; i < width * 2; i++) {
        int pixel_row = row + (i - width);
        int pixel_col = col;

        if (pixel_row < 0) {
            pixel_row = 0;
        }

        if (pixel_row > (M_in - 1)) {
            pixel_row = M_in - 1;
        }

        cross_array[current_index++] = input[pixel_row][pixel_col];
    }

    // Find the vertical elements of the cross.
    for (j = 0; j < height * 2; j++) {
        int pixel_row = row;
        int pixel_col = col + (j - height);

        if (pixel_col < 0) {
            pixel_col = 0;
        }

        if (pixel_col > (N_in - 1)) {
            pixel_col = N_in - 1;
        }

        cross_array[current_index++] = input[pixel_row][pixel_col];
    }

    return cross_array;
}

float*** median_filter (float*** input, int M_in, int N_in)
{
    // Prompt the user.
    printf("What shape would you like to use for the median filter's window?");
    printf(" (1) for cross, (2) for square.\n");
    int option;
    scanf("%d", &option);

    float*** output;
    switch (option) {
        case 2:
            printf("Performing a square-shaped median filter...\n");
            output = square_median_filter(input, M_in, N_in);
            break;
        default:
            printf("Performing a cross-shaped median filter...\n");
            output = cross_median_filter(input, M_in, N_in);
            break;
    }

    return output;
}

float*** square_median_filter (float*** input, int M_in, int N_in)
{
    // Declare output.
    float*** output = alloc3df(3, M_in, N_in);

    // Decide the window of a 2D median filter to be an 3 by 3 pixel array.
    int size = 3;

    int i, j, k, l, m;
    for (k = 0; k < 3; k++) {
        for (i = 0; i < M_in; i++) {
            for (j = 0; j < N_in; j++) {
                int array_size;
                float* square = find_pixel_array(input[k], M_in, N_in, i,
                    j, size, &array_size);

                // Sort the resulting set of pixels.
                for (m = 0; m < array_size - 1; m++) {
                    for (l = m + 1; l < array_size; l++) {
                        if (square[m] > square[l]) {
                            float swap = square[m];
                            square[m] = square[l];
                            square[l] = swap;
                        }
                    }
                }

                // Replace the pixel that we're evaluating with the median
                // pixel.
                int center = (int) floor((double) array_size / 2);
                output[k][i][j] = square[center];
            }
        }
    }

    return output;
}

float*** cross_median_filter (float*** input, int M_in, int N_in)
{
    // Declare output.
    float*** output = alloc3df(3, M_in, N_in);

    // Decide the window of a 2D median filter to be a cross that extends
    // 4 pixels W and E and 4 pixels N and S.
    int width = 4;
    int height = 4;

    int i, j, k, l, m;
    for (k = 0; k < 3; k++) {
        for (i = 0; i < M_in; i++) {
            for (j = 0; j < N_in; j++) {
                int array_size;
                float* cross = find_cross_array(input[k], M_in, N_in, i, j,
                    width, height, &array_size);

                // Sort the resulting set of pixels.
                for (m = 0; m < array_size - 1; m++) {
                    for (l = m + 1; l < array_size; l++) {
                        if (cross[m] > cross[l]) {
                            float swap = cross[m];
                            cross[m] = cross[l];
                            cross[l] = swap;
                        }
                    }
                }

                // Replace the pixel that we're evaluating with the median
                // pixel.
                int center = (int) floor((double) array_size / 2);
                output[k][i][j] = cross[center];
            }
        }
    }

    return output;
}


//histogram

// Helper function that returns the maximum value in an array of integers.
int max_value (int* array, int num_elements)
{
    int i, max = -32000;
    for (i = 0; i < num_elements; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }

    return max;
}

float** generate_density_histogram (float** input, int size, int M_in,
    int N_in)
{
    // Instantiate counting variables used in for loops and the return
    // variable.
    int i, j;
    float** output = alloc2df(size, size);

    // Count the grayscale color present in each pixel.
    int* count = alloc1di(size);

    for (i = 0; i < M_in; i++) {
        for (j = 0; j < N_in; j++) {
            count[(int) input[i][j]]++;
        }
    }

    // Scale the images by making a ratio of (the count / the largest
    // count) and multiply by the total size of our histogram.
    double max = (double) max_value(count, size);

    for (i = 0; i < size; i++) {
        count[i] = (count[i] / max) * size;
    }

    // Create the density histogram.
    for (i = 0; i < size; i++) {
        for (j = 0; j < size; j++) {
            float value;

            if (255 - i < count[j]) {
                value = 255.0;
            } else {
                value = 0.0;
            }
            output[i][j] = value;
        }
    }

    // Deallocate memory.
    free(count);

    return output;
}

float** generate_cumulative_histogram (float** img, int size, int M_in,
    int N_in)
{
    // Instantiate counting variables used in for loops and the return
    // variable.
    int i, j;
    float** output = alloc2df(size, size);

    // Create the cumulative histogram count.
    double* count = alloc1dd(size);
    float density = 1 / (float) (M_in * N_in);

    for (i = 0; i < M_in; i++) {
        for (j = 0; j < N_in; j++) {
            count[(int) img[i][j]] += density;
        }
    }

    // Enable cumulation.
    double total = 0.0;
    for (i = 0; i < size; i++) {
        total += count[i];
        count[i] = total * size;
    }

    // Create the cumulative histogram.
    for (i = 0; i < size; i++) {
        for (j = 0; j < size; j++) {
            float value;

            if (255 - i < count[j]) {

                value = 255.0;
            } else {
                value = 0.0;
            }
            output[i][j] = value;
        }
    }

    // Deallocate memory.
    free(count);

    return output;
}

