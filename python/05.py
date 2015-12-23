#!/usr/bin/env python
## Problem 05
## Decide if a list is a palindrome
import sys
import optparse

input = open('../input_files/01.txt','r')

parser = optparse.OptionParser()
parser.add_option('-l', '--list', dest="list", default="1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4,3,2,1",)
options, remainder = parser.parse_args()
lst = options.list
lst = lst.split(',')

def main(lst):
    half = int(len(lst) / 2.0)
    print "The half way point is: " + str(half)
    front = lst[0:half]
    back = lst
    back.reverse()
    back = back[0:half]
    if (front == back):
        print "This is a palindrome."
    else:
        print "This is not a palindrome."

print lst
main(lst)




