#!/usr/bin/env python
## Problem 04
## Reverse a list (without reverse!)
import sys
import optparse

input = open('../input_files/01.txt','r')

parser = optparse.OptionParser()
parser.add_option('-l', '--list', dest="list", default="1,2,3,4,5,6,7,8,9,0",)
options, remainder = parser.parse_args()
lst = options.list
lst = lst.split(',')

print lst

newlst = list()
for l in lst:
    ## print "Adding " + str(l) + " to position 1 of newlst: " + str(newlst)
    newlst.insert(0, l)

print newlst
