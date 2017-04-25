#!/usr/bin/env perl
use strict;
use warnings;
use diagnostics;
use autodie;
use FileHandle;

## Find the penultimate element of a list.

my $in = new FileHandle;
$in->open("<01.txt");
my $input = "";
while (my $line = <$in>) {
  chomp $line;
  $input .= $line;
}
$in->close();
my @start = split(/\s+/, $input);
my @list = reverse(@start);
shift @list;
my $result = shift @list;
print "The penultimate element of @start is: $result\n";
