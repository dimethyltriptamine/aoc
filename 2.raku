#!/usr/bin/raku

# Como una lata de cerveza
# Que te la bebes y al final
# le das patas sin pensar
# Que me desquicias la cabeza

my ($hpos, $depth) = (0,0);

my @lines = "input".IO.lines;

my @arr;

for @lines -> $i {
	my ($keyword, $n) = $i.split(" ");
	given $keyword {
		when 'forward' {$hpos += $n}
		when 'up' {$depth -= $n}
		when 'down' {$depth += $n}
	}

}

say $hpos * $depth;

($hpos, $depth) = (0,0);
my $aim = 0;

for @lines -> $i {
	my ($keyword, $n) = $i.split(" ");
	given $keyword {
		when 'forward' {
			$hpos += $n;
			$depth += $n * $aim;
		}
		when 'up' {$aim -= $n;}
		when 'down' {$aim += $n;}
	}
}

say $hpos * $depth;
