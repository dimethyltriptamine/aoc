#!/usr/bin/rakudo

my $fh = open "input";

my @thing = $fh.lines;


my Int $increment = 0;
my Int $j = 0;
@thing.map: {
	if $j == 0 {
		++$j;
		next;
	}
 	$increment++ if @thing[$j] > @thing[$j - 1];
	$j++;
}

say "First: There were $increment increments";
$j = 0;
$increment = 0;
my $p_sum = 0;
my $sum = 0;

@thing.map: {
	$sum = (@thing[$j..$j+2]).sum if $j <= 1997;
	
	$increment++ if $p_sum && $sum > $p_sum;
	
	$p_sum = $sum;
	$j++;
}

say "Second: There were $increment increments";
