#!/usr/bin/env python
## Problem 07
## Flatten a list
import sys
import optparse

input = open('../input_files/01.txt','r')

parser = optparse.OptionParser()
parser.add_option('-l', '--list', dest="list", default="1,(2,3),4,(5,6),7,(8,(9),0),9,(8,7,6,5),4,3,(2,1)",)
options, remainder = parser.parse_args()
lst = options.list
lst = lst.split(',')
## Sadly, that is sufficient.
## Lets make it more interesting?
## nah, this problem is boring




