use strict;
use warnings;
use Test::More;
use LWP::UserAgent;
use JSON qw(decode_json);

my $ua = LWP::UserAgent->new;
my $url = 'http://localhost:8080/data/combined3.json';

my $response = $ua->get($url);
ok($response->is_success, 'Fetched JSON file');

my $json = decode_json($response->decoded_content);
for my $title (keys %$json) {
    my $details = $json->{$title};

    ok($details->{steps} && ref $details->{steps} eq 'ARRAY', "'steps' exists and is an array for $title");
    ok($details->{source} && $details->{source} =~ /\S/, "'source' exists and is non-empty for $title");
    ok($details->{second_tradition} && $details->{second_tradition} =~ /\S/, "'second_tradition' exists and is non-empty for $title");
}

done_testing();

