use Test;
BEGIN { plan tests => 3 }
use WWW::Query::UrbanDictionary;

ok(1);

my $def = define_word(WORD => 'perl');
my $def2 = define_word(WORD => 'hello', INDEX => '0');

ok($def =~ m/pur'-el/);
ok($def2 =~ m/what/);