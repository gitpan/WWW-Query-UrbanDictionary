WWW::Query::UrbanDictionary
==========================

A very simple perl module for accessing UrbanDictionary's online JSON API.


### Examples

```perl
use WWW::Query::UrbanDictionary;

my $definition = define_word(WORD => 'perl'); # fetches the first definition of perl
my $thumbs_up = get_thumbs_up(WORD => 'perl', INDEX => '2'); # fetches the popularity of the third definition of perl (0-based index)
```
