#!/usr/bin/rakudo
my @thing = "input".IO.lines;

my ($increment, $j) = (0,0);

@thing.map: {
	if $j == 0 {
		++$j;
		next;
	}
 	$increment++ if @thing[$j] > @thing[$j - 1];
	$j++;
}
say "First: There were $increment increments";

my ($p_sum, $sum) = (0,0);
($j, $increment) = (0,0);

@thing.map: {
	$sum = (@thing[$j..$j+2]).sum if $j <= 1997;
	
	$increment++ if $p_sum && $sum > $p_sum;
	
	$p_sum = $sum;
	$j++;
}
say "Second: There were $increment increments";
