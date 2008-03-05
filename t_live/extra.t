use strict;
use warnings;
use Test::More qw( no_plan );
use WWW::Lengthen;
use t_live::urllist;

my %tests = t_live::urllist->extra_tests;

my $l = WWW::Lengthen->new;

$l->add( %WWW::Lengthen::ExtraServices );

foreach my $name ( sort keys %tests ) {
  eval "require WWW::Shorten::$name";
  next if $@;

  my ($long, $short) = @{ $tests{$name} };
  my $got = $l->try( $short ) || '';
  ok $got eq $long, "$name: $got";
}
