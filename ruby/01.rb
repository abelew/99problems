#!/usr/bin/env ruby

## Now to problem 01: Get the last element of a list, lets assume a list from argv
mylist = []
count = 0
while line = gets()
  for word in line.split(/\W+/)
    mylist[count] = word
  end
end

last = mylist[count]
print "This is the last element:"
print last
print "\n"

