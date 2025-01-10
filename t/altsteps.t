use strict;
use warnings;
use Test::More;

use AA::Altsteps;

# Test loading the steps
my $steps = AA::Altsteps->load_steps();

ok(ref($steps) eq 'HASH', 'Steps are loaded as a hash');
ok(exists $steps->{'Humanist Twelve Steps'}, 'Humanist Twelve Steps exist');
ok(exists $steps->{'Buddhist Non-Theist 12 Steps'}, 'Buddhist Non-Theist 12 Steps exist');

done_testing();

