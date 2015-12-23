#!/usr/bin/env python

## Problem 02
## Find the last but one box of a list
## box is an odd term, looks like it is asking for the last two elements

input = open('../input_files/01.txt','r')

data = []
for line in input:
    datum = line.split()
    data.append(datum)

## I forgot what this list looks like...
data = [val for sublist in data for val in sublist]
print data

data = list(reversed(data))
last = data.pop(0)
penu = data.pop(0)

print "The final two elements are: " + str(penu) + " and " + str(last) + "\n"
