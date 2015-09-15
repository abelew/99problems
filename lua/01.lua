#!/usr/bin/env lua5.3

local an_array = {}

local function read_file(path)
   local file = io.open(path, "r") -- r read mode and (b binary mode)
   if not file then return nil end
   local content = file:read "*a" -- *a or *all reads the whole file
   index = 0
   for value in string.gmatch(content,"[^%s]+") do
      an_array[index] = value
      index = index + 1
   end
   print "The last element is: "
   print (an_array[index-1]);
   file:close()
   return content
end

local file_data = read_file("../input_files/01.txt");

