#!/usr/bin/env python
## Problem 03
## Find the nth element of a list
import sys
import optparse

input = open('../input_files/01.txt','r')

parser = optparse.OptionParser()
parser.add_option('-n', '--number', dest="num", default="1",)
options, remainder = parser.parse_args()
num = int(options.num)

data = []
for line in input:
    datum = line.split()
    data.append(datum)
data = [val for sublist in data for val in sublist]
print data

count = 0
for element in data:
    count = count + 1
    if (count == num):
        print "The " + str(num) + " element is: " + str(element)
