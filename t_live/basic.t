use strict;
use warnings;
use Test::More qw( no_plan );
use WWW::Lengthen;

my $ex   = 'http://example.com/';
my $ex_t = 'http://example.com/test';

my %tests = (
  '0rz'      => [ $ex_t => 'http://0rz.tw/443v7' ],
  Metamark   => [ $ex   => 'http://xrl.us/bdgj9' ],
  NotLong    => [ $ex   => 'http://exampletest.notlong.com' ],
  ShortenURL => [ $ex   => 'http://www.shortenurl.com/9flzo' ],
  Smallr     => [ $ex   => 'http://smallr.com/2ne' ],
  SnipURL    => [ $ex   => 'http://snipurl.com/1vv5c' ],
  TinyURL    => [ $ex   => 'http://tinyurl.com/kotu' ],
  urlTea     => [ $ex   => 'http://urltea.com/1y' ],
);

my $l = WWW::Lengthen->new;
foreach my $name ( sort keys %tests ) {
  my ($long, $short) = @{ $tests{$name} };
  my $got = $l->try( $short ) || '';
  ok $got eq $long, "$name: $got";
}


my $tinyurl_only = WWW::Lengthen->new( 'TinyURL' );
foreach my $name ( sort keys %tests ) {
  my ($long, $short) = @{ $tests{$name} };
  my $got = $tinyurl_only->try( $short ) || '';
  if ( $name eq 'TinyURL' ) {
    ok $got eq $long, "$name: $got";
  }
  else {
    ok $got ne $long, "$name: $got";
  }
}
