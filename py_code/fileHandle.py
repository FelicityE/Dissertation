#!/usr/bin/python
import glob
import numpy as np

# filePath = "EMG_data_for_gestures-master/*/*.txt"

def readFiles(filePath):
  #read files
  fileList = glob.glob(filePath)
  data = list()
  for fileName in fileList:
    data.append(readFile(fileName))



def readFile(fileName):
  file = open(fileName, "r")
  lines = file.readlines()
  data = list()
  temp = []
  count = 0
  for line in lines:
    data.append(line.split())
    col = len(line.split())
    for(i = 0; i < coll i++):
      tempLine = line.split()
    temp[count][col] =     
    count+=1
  
  return data, temp

filePath = "EMG_data_for_gestures-master/01/1_raw_data_13-12_22.03.16.txt"
data,temp = readFile(filePath)

print(temp[0:2])