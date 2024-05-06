#!/bin/perl -w

use strict;
use feature 'say';
use Data::Dumper;

sub Pascals_Triangle{
	my $n = shift;
	my @p = ([1], [1, 1]);
	my @p_new;

	foreach my $row (2 .. ($n - 1)){
		my @newline = (1);

		foreach (1 .. ($row - 1)){
			push(@newline, ($p[$row-1][$_-1] + $p[$row-1][$_]))	
		}
		push(@newline, 1);
		my $ref_newline = \@newline;
		push(@p, $ref_newline);
	}
	
	@p = map {join(' ', @$_)} @p;

	my $max_len = length($p[-1]);

	foreach (@p){
		my $space = int(($max_len - length($_)) / 2);
		say(' ' x $space . $_)
	}
}

Pascals_Triangle(10)

#             1
#            1 1
#           1 2 1
#          1 3 3 1
#         1 4 6 4 1
#       1 5 10 10 5 1
#     1 6 15 20 15 6 1
#    1 7 21 35 35 21 7 1
#  1 8 28 56 70 56 28 8 1
#1 9 36 84 126 126 84 36 9 1
