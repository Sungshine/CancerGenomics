#!/usr/bin/perl
use strict;
use warnings;

#merge mutalyzer result with original database

my ($input1, $input2) = @ARGV;
my %hash;

open (INPUT, $input2) or die "could not open input file\n";

my $header = <INPUT>;

while (my $line = <INPUT>) {
  if ($line =~ m/^NM_000059\.3:(.*)\s+NC_000013\.11:g\.(\d+)/) {
    my $key = $1;
    my $value = $2;
    $key =~ s/\s//g;
    print "$key\t$value\n";
    $hash{$key} = $value;
  }
}
close (INPUT);

open (INPUT, $input1) or die "could not open second input file\n";

$header = <INPUT>;


while (my $line = <INPUT>) {
  my @line = split(/\t/, $line);
  chomp @line;
  $line[2] =~ s/\s//g;
  if (exists $hash{$line[2]}) {
    my $local = $hash{$line[2]};
    print "$line\t$local\n";
  }
  else {
   print "$line\tError\n";
  }
}
close (INPUT);
