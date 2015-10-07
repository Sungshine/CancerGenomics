#!/usr/bin/perl
use strict;
use warnings;

# convert BRCA1 and BRCA2 database into mutalyzer useable format

my $input = $ARGV[0];

open (INPUT, $input) or die "could not open input file\n";

my $header = <INPUT>;

while (my $line = <INPUT>) {
	my @line = split(/\t/, $line);
	chomp @line;
	print "NM_007294.3:$line[2]\n";
}
close (INPUT);
