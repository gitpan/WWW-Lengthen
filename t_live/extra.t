use strict;
use warnings;
use Test::More qw( no_plan );
use WWW::Lengthen;

my $ex   = 'http://example.com/';
my $ex_t = 'http://example.com/test';

my %tests = (
  OneShortLink => [ $ex   => 'http://1sl.net/1239' ],
  Tinylink     => [ $ex_t => 'http://tinylink.com/?nlxzHox18M' ],
);

my $l = WWW::Lengthen->new;

$l->add( %WWW::Lengthen::ExtraServices );

foreach my $name ( sort keys %tests ) {
  eval "require WWW::Shorten::$name";
  next if $@;

  my ($long, $short) = @{ $tests{$name} };
  my $got = $l->try( $short ) || '';
  ok $got eq $long, "$name: $got";
}
