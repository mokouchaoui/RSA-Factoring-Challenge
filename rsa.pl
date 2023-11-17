#!/usr/bin/perl
use strict;
use warnings;

# Check if a number is prime
sub is_prime {
    my ($n) = @_;
    return 0 if $n <= 1;
    return 1 if $n <= 3;
    return 0 if ($n % 2 == 0 || $n % 3 == 0);
    for (my $i = 5; $i * $i <= $n; $i += 6) {
        return 0 if ($n % $i == 0 || $n % ($i + 2) == 0);
    }
    return 1;
}

# Function to find prime factors
sub prime_factorize {
    my ($n) = @_;
    for (my $i = 2; $i <= $n / 2; $i++) {
        if ($n % $i == 0 && is_prime($i) && is_prime($n / $i)) {
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
        my ($factor1, $factor2) = prime_factorize($number);
        print "$number=$factor1*$factor2\n";
    }

    close($fh);
}

main();
