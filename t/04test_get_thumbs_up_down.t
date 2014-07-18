use Test;
BEGIN { plan tests => 3 }
use WWW::Query::UrbanDictionary;

ok(1);

my $up = get_thumbs_up(WORD => 'perl');
my $down = get_thumbs_down(WORD => 'perl');

ok($up =~ m/[0-9]/);
ok($down =~ m/[0-9]/);