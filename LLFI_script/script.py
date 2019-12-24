#!/usr/bin/env python
import sys
import glob
import shutil
import os
from sys import argv
from PIL import Image
from os import listdir
from os.path import isfile, join
import numpy
import subprocess 
from timeit import default_timer as timer

projectname="detection"
Methodfile="methods.txt"
Template_Yamlfile="input_template.yaml"
Yamlfile="input.yaml"
llfiAddress="/home/ubuntu/Desktop/llfi/"
#sys.stdout = open(output_data, 'w')
#out = sys.stdout

NumberOfRuns="10"

if os.path.exists("Makefile"):
	subprocess.call(["make","clean"])
	os.remove("Makefile")
subprocess.call([llfiAddress+"tools/GenerateMakefile" , "--readable" , "--all" , "-o" , projectname + ".ll"])
subprocess.call(["make"])
f = open(Methodfile, "r")
lines = f.readlines()
for line in lines:
	s = line.split()
	if (int(s[0]) == 1):
		if os.path.exists("llfi"):
			shutil.rmtree("llfi")
		method=s[1]
		print ("----------------- Start ... [Method:"+method+"] -----------------")
		y = open(Yamlfile,"w")
		for line in open(Template_Yamlfile):
			line = line.replace("%N",NumberOfRuns)
			line = line.replace("%M","["+method+"]")
			y.write(line) 
		y.close()
		start_time = timer()	
		subprocess.call([llfiAddress+"/bin/instrument" , "--readable" , projectname + ".ll"])
		subprocess.call([llfiAddress+"/bin/profile" , "./llfi/" + projectname + "-profiling.exe" , "6"])
		subprocess.call([llfiAddress+"/bin/injectfault" , "./llfi/" + projectname + "-faultinjection.exe" , "6"])
		end_time = timer()
		running_time=(end_time-start_time)/60
		if (os.path.exists(method)):
			subprocess.call(["mv",method,method+"_old"])
		subprocess.call(["mkdir",method])
		report_file = open(method+'/log.txt', 'a+')
		report_file.write("Time taken: " + str(running_time)+ " min \n")

		if os.path.exists("./llfi/prog_output"):
			subprocess.call(["cp","-r","./llfi/prog_output", method ])

		else:
			print('The prog_output folder does not exists')

		if os.path.exists("./llfi/error_output"):
			subprocess.call(["cp","-r","./llfi/error_output", method ])

		else:
			print('The error_output folder does not exists')

		
		if os.path.exists("./llfi/std_output"):
			subprocess.call(["cp","-r","./llfi/std_output", method ])

		else:
			print('The std_output folder does not exists')

		print ("---------------------------- Finish -----------------------------")
		print ("----------------- Start ... [Method:"+method+"] -----------------")
	
		print("\n")

		report_file.close()


