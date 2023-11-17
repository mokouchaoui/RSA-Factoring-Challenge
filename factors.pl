#!/usr/bin/perl
use strict;
use warnings;

# Function to factorize a number
sub factorize {
    my ($n) = @_;
    for (my $i = 2; $i <= int(sqrt($n)); $i++) {
        if ($n % $i == 0) {
            return ($i, $n / $i);
        }
    }
    return (1, $n);  # Return the number itself if no factors found
}

# Main program
sub main {
    my $file = $ARGV[0] or die "Usage: $0 <file>\n";
    open(my $fh, '<', $file) or die "Could not open file '$file' $!";

    while (my $number = <$fh>) {
        chomp $number;
        my ($factor1, $factor2) = factorize($number);
        print "$number=$factor1*$factor2\n";
    }

    close($fh);
}

main();
