#!/usr/bin/env python
import array

input = open('../input_files/01.txt', 'r')

data = []
for line in input:
 datum = line.split()
 data.append(datum)

flattened = [val for sublist in data for val in sublist]
##last = flattened.pop()  ## pop() with no argument grabs the last element.

reverse_list = list(reversed(flattened))
last = reverse_list.pop(0)

print "The final element was: " + str(last)
