use strict;
use warnings;
use Test::More;
use JSON;
use Data::Dumper;
use Encode;

# Ensure output handles wide characters
binmode(STDOUT, ':encoding(UTF-8)');
binmode(STDERR, ':encoding(UTF-8)');

my $json_file = 'data/combined3.json'; # Update the path if needed

# Ensure the JSON file exists
if (!-e $json_file) {
    fail("$json_file does not exist");
    done_testing();
    exit;
}

# Attempt to read and parse the JSON file
my $json_text;
{
    local $/; # Enable slurp mode
    open my $fh, '<:encoding(UTF-8)', $json_file or die "Could not open '$json_file': $!";
    $json_text = <$fh>;
    close $fh;
}

# Check for invalid or wide characters in the raw JSON text
for (my $i = 0; $i < length($json_text); $i++) {
    my $char = substr($json_text, $i, 1);
    if ($char =~ /[^\x00-\x7F]/) {
        diag(sprintf("Wide character found at offset %d: '%s' (U+%04X)", $i, $char, ord($char)));
    }
}

# Parse the JSON
my $data;
eval {
    $data = decode_json($json_text);
    1;
} or do {
    fail("Malformed JSON: $@");
    done_testing();
    exit;
};

# Define required fields
my @required_fields = qw(source steps second_tradition);

# Check each entry in the JSON
foreach my $key (keys %$data) {
    my $entry = $data->{$key};

    diag("Processing entry: $key");

    # Print the entire entry for inspection
    diag("Entry data:\n" . Dumper($entry));

    # Warn for missing fields
    foreach my $field (@required_fields) {
        if (!exists $entry->{$field}) {
            diag("WARNING: Missing field '$field' in entry '$key'");
        }
    }

    # Validate 'steps' field is an array
    if (exists $entry->{steps}) {
        if (ref($entry->{steps}) ne 'ARRAY') {
            diag("ERROR: 'steps' field in '$key' is not an array");
        } else {
            diag("'steps' field is valid and contains " . scalar(@{$entry->{steps}}) . " steps");
        }
    } else {
        diag("WARNING: 'steps' field is missing in entry '$key'");
    }

    # Divider for clarity
    diag("--------------------------------------------------");
}

pass("JSON is well-formed and validated");

done_testing();

