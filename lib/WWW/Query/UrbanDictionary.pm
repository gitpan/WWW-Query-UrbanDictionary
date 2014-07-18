# UrbanDictionary.pm
# Grabs UrbanDictionary.com definitions and other data using its JSON API
# Author: William Woodruff
# License: MIT
# ABSTRACT: Queries UrbanDictionary

package WWW::Query::UrbanDictionary;

use strict;
use warnings;

use Exporter;
use LWP::Simple;
use JSON qw(decode_json);
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = qw(define_word get_author get_permalink get_thumbs_up get_thumbs_down get_tags);
@EXPORT_OK = qw(define_word get_author get_permalink get_thumbs_up get_thumbs_down get_tags);

our $urban_url = "http://api.urbandictionary.com/v0/define?term=";

sub define_word {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'definition'}
}

sub get_author {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'author'}
}

sub get_permalink {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'permalink'}
}

sub get_thumbs_up {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'thumbs_up'}
}

sub get_thumbs_down {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	my $index = $keys{INDEX} || 0;
	my @definitions = @{decode_json(get($urban_url . $word))->{'list'}};
	return $definitions[$index]->{'thumbs_down'}
}

sub get_tags {
	my (%keys) = @_;
	my $word = $keys{WORD} || die "No word provided.\n";
	return @{decode_json(get($urban_url . $word))->{'tags'}};
}

1;

=head1 NAME

WWW::Query::UrbanDictionary - An interface to UrbanDictionary's JSON API

=head1 SYNOPSIS

use WWW::Query::UrbanDictionary;
my $definition = define_word(WORD => 'perl');

=head1 DESCRIPTION

WWW::Query::UrbanDictionary provides a set of simple methods for accessing definitions
and other data available through UrbanDictionary's online JSON API.

=head2 Methods

=over 12

=item C<< define_word(WORD => $word, INDEX => $index) >>

Returns the defintion for the word at the given index.
If no index is given, the first definition is given (index 0).

=item C<< get_author(WORD => $word, INDEX => $index) >>

Returns the author of the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< get_permalink(WORD => $word, INDEX => $index) >>

Returns a permalink to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< get_thumbs_up(WORD => $word, INDEX => $index) >>

Returns the number of 'thumbs up's given to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< get_thumbs_down(WORD => $word, INDEX => $index) >>

Returns the number of 'thumbs down's given to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<get_tags(WORD => $word)>

Returns an array of tags associated with the given word.

=back

=head1 LICENSE

WWW::Query::UrbanDictionary is released under the MIT License.

=head1 AUTHOR

William Woodruff - L<http://woodruffw.us>

=head1 SEE ALSO

L<http://search.cpan.org/~sock/WWW-Search-UrbanDictionary-0.4/lib/WWW/Search/UrbanDictionary.pm>

=cut