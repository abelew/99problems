#!/usr/bin/env python
## Problem 08
## Remove duplicate entries of a list
## Note that it is explicitly consecutive duplicates
## so only when it is 1,1  not 1,2,1
import sys
import optparse

input = open('../input_files/01.txt','r')

parser = optparse.OptionParser()
parser.add_option('-l', '--list', dest="list", default="1,1,3,3,5,5,7,8,8,5,5,3,2,1")
options, remainder = parser.parse_args()
lst = options.list
lst = lst.split(',')
## Sadly, that is sufficient.
## Lets make it more interesting?
## nah, this problem is boring

def main(lst):
    i = 0
    added = 0
    n = len(lst)
    new_list = list()
    while i < n:
        element = lst[i]
        i = i + 1
        if (i < n):
            next = lst[i]
            added = added + 1
            print "The test is: " + element + " vs. " + next + "\n"
            if (element != next):
                print "Pushing " + element + "\n"
                new_list.insert(added, element)
                print "The original list was: " + str(lst) + "\n"
        elif (i == n):
            last = lst[i - 2]
            if (element != last):
                added = added + 1
                print "Pushing " + element + "\n"
            new_list.insert(added, element)
        else:
            print "Somehow i got bigger than n!\n"
    print "The new list is: " + str(new_list) + "\n"
    return(new_list)

main(lst)






