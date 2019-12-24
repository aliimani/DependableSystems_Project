#ifndef EDGE_DETECTION_H
#define EDGE_DETECTION_H

float*** apply_Laplacian_of_Gaussian(float*** input, int M_in, int N_in,
	float threshold, int square_size);
float*** detect_edges(float*** input, int M_in, int N_in);

float* find_cross_array (float** input, int M_in, int N_in, int row, int col,
    int width, int height, int* array_size);
float* find_pixel_array (float** input, int M_in, int N_in,
    int row, int col, int size, int* array_size);
float*** median_filter (float*** input, int M_in, int N_in);
float*** square_median_filter (float*** input, int M_in, int N_in);
float*** cross_median_filter (float*** input, int M_in, int N_in);

float** add (float** arrayOne, float** arrayTwo, int row, int col);
float** subtract (float** arrayOne, float** arrayTwo, int row, int col);
float** find_pixel_matrix (float** input, int M_in, int N_in,
    int row, int col, int size);
float convolve_matrices (float** array_one, float** array_two, int size);
float*** convolve (float*** input, int M_in, int N_in, float** kernel, int dim);

float*** lowpass_filter(float*** input, int M_in, int N_in);
float*** highpass_filter(float*** input, int M_in, int N_in);
float** lowpass_filter_3by3kernel();
float** highpass_filter_3by3kernel();
float*** enhance_contrast (float*** input, int M_in, int N_in);

float*** linear_stretch (float*** input, int M_in, int N_in);

float*** min_max_stretch (float*** input, int M_in, int N_in, double cutoff);

// Helper function that returns the maximum value in an array of integers.
int max_value (int* array, int num_elements);

float** generate_density_histogram (float** input, int size, int M_in,
    int N_in);

float** generate_cumulative_histogram (float** img, int size, int M_in,
    int N_in);



#endif

