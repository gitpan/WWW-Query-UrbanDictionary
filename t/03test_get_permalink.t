use Test;
BEGIN { plan tests => 2 }
use WWW::Query::UrbanDictionary;

ok(1);

my $link = get_permalink(WORD => 'perl');

ok($link =~ m/http:\/\//);