package AA::Altsteps;

use strict;
use warnings;
use 5.006;
use JSON;
use File::Spec;

our $VERSION = '0.01';

sub load_steps {
    my $class = shift;

    # Locate the JSON file in the data directory
    my $data_dir = File::Spec->catdir(File::Spec->curdir(), 'data');
    my $json_file = File::Spec->catfile($data_dir, 'altsteps.json');

    # Open and parse the JSON file
    open my $fh, '<', $json_file or die "Cannot open $json_file: $!";
    local $/; # Enable slurp mode
    my $json_text = <$fh>;
    close $fh;

    my $data = decode_json($json_text);
    return $data;
}

=head1 NAME

AA::Altsteps - The great new AA::Altsteps!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use AA::Altsteps;

    my $foo = AA::Altsteps->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Secretary Harry, C<< <fuckgoogle at example.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-aa-altsteps at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=AA-Altsteps>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.



1;



=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc AA::Altsteps


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=AA-Altsteps>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/AA-Altsteps>

=item * Search CPAN

L<https://metacpan.org/release/AA-Altsteps>

=back


=head1 ACKNOWLEDGEMENTS





=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2025 by Secretary Harry.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)


=cut

1; # End of AA::Altsteps
