#!/usr/bin/env python
import os
import re
import sys
import glob
import numpy
import shutil
#import subprocess 
#from sys import argv
from PIL import Image, ImageFile
from os import listdir
from os.path import isdir, isfile, join
# from colorama import 
from colorama import init, Fore, Back, Style
from timeit import default_timer as timer

ImageFile.LOAD_TRUNCATED_IMAGES = True

init()
root_path = './'
baseline_path = 'baseline/'
output_path = 'prog_output/'
error_path = 'error_output/'
final_result_path= root_path + 'final_result.txt'

number_of_fault_injections = 10

methods = [f for f in listdir(root_path) if isdir(join(root_path, f))]
baseline_images = [f for f in listdir(baseline_path) if isfile(join(baseline_path, f))]

methods.sort()
baseline_images.sort()

print ("Running Compare images version 4.0 ...")

elem_methods = len(methods)
elem_baseline_files = len(baseline_images)

number_of_images = elem_baseline_files

final_result_file = open(final_result_path , 'w')
final_result_file.write("Method name:\n")
final_result_file.write("The number of baseline images:\n")
final_result_file.write("The number of fault injections per image:\n")
final_result_file.write("The total time taken(minutes):\n")
final_result_file.write("The average time taken per injection (seconds):\n")
final_result_file.write("The total number NoERR output images:\n")
final_result_file.write("The number of Corrupted output images:\n")
final_result_file.write("The number of Readable output images with different pixels:\n")
final_result_file.write("The number of Unreadable output images:\n")
final_result_file.write("The average number of different pixels:\n")
final_result_file.write("The number of Terminations/Crashes:\n")
final_result_file.close()	



def compare_images(file_1, file_2):
	global num_NoERR_images
	global num_Corrupted_images
	global num_Readable_images
	global num_Unreadable_images
	global num_different_pixels
	global num_Terminations
	file_path_1 = root_path + baseline_path + file_1
	file_path_2 = method_folder + output_path + file_2
	print ("Comparing images\nFile1 = %s\nFile2 = %s" % (file_path_1, file_path_2))      
    # save the time when search for element started
	starting_time = timer()
	file1 = openImage(file_path_1)
	file2 = openImage(file_path_2)	
	file2_size=os.path.getsize(file_path_2)
	if (file2 != None):
		status="Readable"
		w1 = file1.size[0]
		h1 = file1.size[1]

		w2 = file2.size[0]
		h2 = file2.size[1]

		if w1 != w2 or h1 != h2:
			print ("Images have different dimensions!")
			return False

		width = w1
		height = h1

		im1 = file1.load()
		im2 = file2.load()

		failed_pixels = 0
		dimension=str(height)+"x"+str(width)
		i = 0
		while i < height:
			j = 0
			while j < width:
				if im1[j, i] != im2[j, i]:
					failed_pixels += 1
				j += 1
			i += 1

		print ("Number of unequal pixels = %s of total %s" % (failed_pixels, (height * width)))

		diff = round ((float(failed_pixels) * 100 /(height * width)),3)
		num_different_pixels = num_different_pixels + failed_pixels
		print ("Percentage of unequal pixels = %s" % diff)
		if diff != 0:
			num_Readable_images = num_Readable_images + 1
			print (Fore.GREEN + 'Please wait...')
			if not os.path.exists(method_folder + 'different_images'):
				os.mkdir(method_folder + 'different_images')
			shutil.copy2(file_path_2, method_folder + 'different_images')
		

		# print the time taken to find element
	else:
		diff = 100.0
		dimension = '0 x 0'
		height = 0
		width = 0 
		failed_pixels = 0
		dimension = 0
		status = 'Unreadable'
		num_Unreadable_images = num_Unreadable_images + 1
		print ("unreadable image size is: %s" %(file2_size))
		print(Style.RESET_ALL)
		if not os.path.exists(method_folder + 'unreadable_images'):
			os.mkdir(method_folder + 'unreadable_images')
		shutil.copy2(file_path_2, method_folder + 'unreadable_images')
	
	if diff == 0:
		print (Fore.GREEN + "Comparison passed! Images are equal!")
		print(Style.RESET_ALL)
		NoERR = 'Yes'
		num_NoERR_images = num_NoERR_images + 1
	else:
		print (Fore.RED + "Comparison failed! Images differ!")
		print(Style.RESET_ALL)
		NoERR = 'No'
		num_Corrupted_images = num_Corrupted_images + 1
	time_taken = round((timer() - starting_time),3)
	print("Time taken to compare images= %s seconds" % str(time_taken))
	report_file.write("%s	%s	%s	%s	%s	%s	%s	%s	%s	%s\n" % (baseline , file_2 , NoERR 
				, status , file2_size , dimension , ((height * width) - failed_pixels) , failed_pixels , diff , time_taken))
	



def openImage(filename):
	try:
		theImage = Image.open(filename)
		return theImage
	except:
		print(Fore.RED +"This image is unreadable")
		return


def isImage(filename):
    if filename.endswith(('.jpg', '.JPG', '.jpeg', 'JPEG', '.png', '.PNG', 'gif', 'GIF')):
        return True
    return False

comparing_start_time = timer()
for elem_method in range(elem_methods):
	num_NoERR_images = 0
	num_Corrupted_images = 0
	num_Readable_images = 0
	num_Unreadable_images = 0
	num_different_pixels = 0
	num_Terminations = 0
	if methods[elem_method] != 'baseline':
		method = methods[elem_method]
		method_folder = root_path + method + "/"
		output_images = [f for f in listdir(method_folder + output_path) if isfile(join(method_folder + output_path, f))]
		error_files = [f for f in listdir(method_folder + error_path) if isfile(method_folder + join(error_path, f))]
		
		output_images.sort()
		error_files.sort()
		
		elem_output_files = len(output_images)
		elem_error_files = len(error_files)
		
		total_number_of_corrupted_files=0
		total_number_of_different_files=0
		total_number_of_similar_files=0
		
		if not os.path.exists(method_folder + 'log.txt'):
			os.rename(method_folder + 'report.txt', method_folder + 'log.txt')
		result_file = open(method_folder + 'log.txt', 'r')
		lines = result_file.readlines()
		fault_time_taken = lines[0].split()
		fault_injection_time_taken =(round(float(fault_time_taken[2]),3))
		
		print(Fore.BLUE + "*******************[ %s ]********************" % (method))
		print(Style.RESET_ALL)
		report_file = open(method_folder + 'report.txt', 'w')
		#report_file.write ("Compare the output images with golden one\n")
		report_file.write("-------------------------------------[ Method : %s ]-------------------------------------\n" % (method))
		report_file.write("Basleline	Output image name   	NoERR image 	Status  	Size(Byte)  	Dimension   	" + 
		"The total number of equal pixels  	The number of unequal pixels    	The percentage of unequal pixels    	" + 
		"Time taken to compare images(Sec)\n") 
		
		for elem_baseline in range(elem_baseline_files):
			if isImage(baseline_images[elem_baseline]):
				baseline=((baseline_images[elem_baseline])[0:4])
				print(Fore.GREEN + "---------------------[ %s ]---------------------" % (baseline))
				print(Style.RESET_ALL)
				for elem_output in range(elem_output_files):
					output_image=output_images[elem_output]
					if isImage(output_image):
						if ((output_image[0:4]) == baseline):
							compare_images(file_1 = (baseline_images[elem_baseline]), file_2 = (output_image))
							print("--------------------------------------------------\n")
			
		report_file.close()
		num_Terminations = (number_of_images * number_of_fault_injections ) - (num_NoERR_images + num_Corrupted_images)
		avg_time_taken = round(((fault_injection_time_taken / (number_of_images * number_of_fault_injections))*60),2)
		if num_different_pixels == 0:
			num_pixels = 0
		else:
			num_pixels = round((num_different_pixels / num_Readable_images),0)
		
		result_file = open(method_folder + method + '.txt', 'w')
		result_file.write("Method name:	%s \n" % (method))
		result_file.write("The number of baseline images:	%s \n" % (number_of_images))
		result_file.write("The number of fault injections per image:	%s \n" % (number_of_fault_injections))
		result_file.write("The total time taken(minutes):	%s \n" % (fault_injection_time_taken))
		result_file.write("The average time taken per injection (seconds):	%s \n" % (avg_time_taken))
		result_file.write("The total number NoERR output images:	%s \n" % (num_NoERR_images))
		result_file.write("The number of Corrupted output images:	%s \n" % (num_Corrupted_images))
		result_file.write("The number of Readable output images with different pixels:	%s \n" % (num_Readable_images))
		result_file.write("The number of Unreadable output images:	%s \n" % (num_Unreadable_images))
		result_file.write("The average number of different pixels:	%s \n" % (num_pixels))
		result_file.write("The number of Terminations/Crashes:	%s \n" % (num_Terminations))
		result_file.close()
		
		final_result_file = open(final_result_path , 'r')
		result_lines = final_result_file.readlines()
		
		result_lines[0]= re.sub('\n', '', result_lines[0])
		result_lines[1]= re.sub('\n', '', result_lines[1])
		result_lines[2]= re.sub('\n', '', result_lines[2])
		result_lines[3]= re.sub('\n', '', result_lines[3])
		result_lines[4]= re.sub('\n', '', result_lines[4])
		result_lines[5]= re.sub('\n', '', result_lines[5])
		result_lines[6]= re.sub('\n', '', result_lines[6])
		result_lines[7]= re.sub('\n', '', result_lines[7])
		result_lines[8]= re.sub('\n', '', result_lines[8])
		result_lines[9]= re.sub('\n', '', result_lines[9])
		result_lines[10]= re.sub('\n', '', result_lines[10])
		
		result_lines[0]  = result_lines[0] + ('	%s\n' % (method))
		result_lines[1]  = result_lines[1] + ('	%s\n' % (number_of_images))
		result_lines[2]  = result_lines[2] + ('	%s\n' % (number_of_fault_injections))
		result_lines[3]  = result_lines[3] + ('	%s\n' % (fault_injection_time_taken))
		result_lines[4]  = result_lines[4] + ('	%s\n' % (avg_time_taken))
		result_lines[5]  = result_lines[5] + ('	%s\n' % (num_NoERR_images))
		result_lines[6]  = result_lines[6] + ('	%s\n' % (num_Corrupted_images))
		result_lines[7]  = result_lines[7] + ('	%s\n' % (num_Readable_images))
		result_lines[8]  = result_lines[8] + ('	%s\n' % (num_Unreadable_images))
		result_lines[9]  = result_lines[9] + ('	%s\n' % (num_pixels))
		result_lines[10] = result_lines[10] + ('	%s\n' % (num_Terminations))
		
		final_result_file = open(final_result_path , 'w')
		final_result_file.writelines(result_lines)
		final_result_file.close()
		
comparing_time = round(((timer() - comparing_start_time) / 60), 3)
print(Fore.GREEN + "--------------------- Finish ----------------------\n")
print(Style.RESET_ALL)
print("Number of baseline images : %s\n" % (number_of_images))
print ("Number of output images per baseline image: %s\n" % (number_of_fault_injections))
print("Time taken for comparing all images with their baseline image: %s minutes" % (comparing_time))


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	