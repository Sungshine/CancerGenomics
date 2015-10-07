#!/usr/bin/perl
use strict;
use warnings;

# Change database file into bed format so it is compatible with liftOver

my $input = $ARGV[0];

open (INPUT, $input) or die "could not open input  file\n";

while (my $line = <INPUT>) {
        my @line = split(/\t/, $line);
        chomp @line;
        if ($line[2] == $line[1]) {
                $line[2]++;
        } 
        print "$line[0]\t$line[1]\t$line[2]\t$line[3]\t$line[53]\n";
}
close (INPUT);
