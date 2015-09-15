#!/usr/bin/env perl
use common::sense;
use autodie;

open(IN, "<../01.txt");
my $input = "";
while (my $line = <IN>) {
    chomp $line;
    $input .= $line;
}
close(IN);
my @list = split(/\s+/, $input);
print "The last element was: $list[$#list]\n";
    
