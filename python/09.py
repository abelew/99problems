#!/usr/bin/env python
# Problem 09
# Pack elements into sublists
# mypack([a a a a b c c a a d e e e e])
# Should evaluate to [[a a a a] [b] [c c] [a a] [d] [e e e e]]
# import sys
import optparse

parser = optparse.OptionParser()
parser.add_option('-l', dest="list",
                  default="1,1,1,1,1,1,1,3,3,5,5,7,8,8,5,5,3,2,1,1")

options, remainder = parser.parse_args()
lst = options.list
lst = lst.split(',')

def main(lst):
    i = 0
    added_counter = 0
    sub_counter = 0
    n = len(lst)
    new_list = list()
    final_list = list()
    while i < n:
        element = lst[i]
        i = i + 1
        if (i < n):
            next = lst[i]
            added_counter = added_counter + 1
            if (element == next):
                new_list.insert(added_counter, element)
            else:
                new_list.insert(added_counter, element)
                final_list.insert(sub_counter, new_list)
                sub_counter = sub_counter + 1
                new_list = list()
                added_counter = 1
        elif (i == n):
            last = lst[i - 2]
            if (element == last):
                new_list.insert(added_counter, element)
                final_list.insert(sub_counter, new_list)
            else:
                final_list.insert(sub_counter, new_list)
                sub_counter = sub_counter + 1
                new_list = list()
                new_list.insert(1, element)
                final_list.insert(sub_counter, new_list)
        else:
            print "Somehow i got bigger than n!\n"
    print "The final list is: " + str(final_list) + "\n"
    return(final_list)

main(lst)
