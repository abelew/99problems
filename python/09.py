#!/usr/bin/env python
## Problem 09
## Pack elements into sublists
## mypack([a a a a b c c a a d e e e e])
## Should evaluate to [[a a a a] [b] [c c] [a a] [d] [e e e e]]
import sys
import optparse

parser = optparse.OptionParser()
parser.add_option('-l', '--list', dest="list", default="1,1,3,3,5,5,7,8,8,5,5,3,2,1,1")
options, remainder = parser.parse_args()
lst = options.list
lst = lst.split(',')

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
                ## The current element is not the same as the next element, herp derp
                print "First adding the existing small list to the final list\n"
                final_element = final_element + 1
                final_list.insert(new_list, final_element)
                print "Pushing " + element + " to a new list.\n"
                new_list = list()
                added = 1
                new_list.insert(added, element)
            else:
                ## They are the same, so append the current element to the temp list
                new_list.inser(added, element)
        elif (i == n):
            last = lst[i - 2]
            if (element != last):
                added = added + 1
                print "Pushing " + element + "\n"
            new_list.insert(added, element)
        else:
            print "Somehow i got bigger than n!\n"
    print "The new list is: " + str(new_list) + "\n"
    return(final_list)

main(lst)






