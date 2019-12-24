#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "array_utility.h"
#include "lodepng.h"
#include "rotate.h"

float*** png_to_ppm (unsigned char* image, unsigned width, unsigned height)
{
    float*** img = alloc3df(3, height, width);

    int i, j;
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            img[0][i][j] = image[3 * i * width + 3 * j + 0]; // Red.
            img[1][i][j] = image[3 * i * width + 3 * j + 1]; // Green.
            img[2][i][j] = image[3 * i * width + 3 * j + 2]; // Blue.
        }
    }

      return img;
}
unsigned char* ppm_to_png (float*** image, unsigned width, unsigned height)
{
    unsigned char* img = (unsigned char*) malloc(3 * width * height *
        sizeof(unsigned char));

    // Perform linear stretch before converting to PNG.
    int i, j, k;

    for (k = 0; k < 3; k++) {
        float min = 9e9;
        float max = -min;

        for (i = 0; i < height; i++) {
            for (j = 0; j < width; j++) {
                float v = image[k][i][j];
                if (min > v) {
                    min = v;
                }
                if (max < v) {
                    max = v;
                }
            }
        }

        float v = 254.99 / (max - min);

        for (i = 0; i < height; i++) {
            for (j = 0; j < width; j++) {
                img[3 * i * width + 3 * j + k] = (image[k][i][j] - min) * v;
            }
        }
    }

      return img;
}

int main ()
{
    int d;
    int action = 15;
    char filename[256];
    char saved_filename[256];
    unsigned error;
    unsigned char* image;
    unsigned width, height;
    for (d=1000; d<1100; d++ ){
	   sprintf(filename, "%d", d);
       strcat(filename, ".png");
        
        // printf("Type in the name of the PNG file you would like to process.\n");
        //  scanf("%s", filename);


        setbuf(stdout, NULL);

         // Load the PNG using LodePNG library.
        printf("Loading the file into memory...\n\n\n");
 

       error = lodepng_decode24_file(&image, &width, &height, filename);
        if (error) {
          printf("Error (%u) loading file: %s\n", error,
                   lodepng_error_text(error));
          exit(1);
       }

        // Then use array to load into a three-dimensional array of R, G,
        // and B values.
       float*** input = png_to_ppm(image, width, height);
          free(image);

        int i, j;
        int output_height, output_width;
        float*** output = (float ***) malloc(3 * sizeof(float**));
        output_height = height;
        output_width = width;
        output = rotate(input, height, width);

        strncpy(saved_filename, filename, 256);
        saved_filename[strlen(saved_filename) - 4] = 0;
        strcat(saved_filename, "_rotated.png");

     // Save the file and indicate what the file was saved as.
        unsigned char* output_png = ppm_to_png(output, output_width, output_height);
       dealloc3df(output, 3, output_height, output_width);
       error = lodepng_encode24_file(saved_filename, output_png,
       output_width, output_height);
       if (error) {
           printf("Error (%u) saving file: %s\n\n\n", error,lodepng_error_text(error));
        } else {
            printf("The file was successfully saved as %s.\n\n\n",saved_filename);
        }

       dealloc3df(input, 3, height, width);
    }
}
