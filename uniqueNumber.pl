#!/usr/bin/perl
use strict;
use warnings;

# add unique number to each line of data base and bed formatted database so they can be merged together after liftOver

my $input = $ARGV[0];
my $count = 0;

open (INPUT, $input) or die "could not open input  file\n";

while (my $line = <INPUT>) {
        $count++;
        $line =~ s/\R//g;
        print "$line\t$count\n";
}
close (INPUT);
