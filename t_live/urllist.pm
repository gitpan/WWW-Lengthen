package #  hide from PAUSE
  t_live::urllist;

use strict;
use warnings;

my $ex   = 'http://example.com/';
my $ex_t = 'http://example.com/test';

sub basic_tests {(
  '0rz'      => [ $ex_t => 'http://0rz.tw/443v7' ],
  Metamark   => [ $ex   => 'http://xrl.us/bdgj9' ],
  NotLong    => [ $ex   => 'http://exampletest.notlong.com' ],
  ShortenURL => [ $ex_t => 'http://www.shortenurl.com/9ugbj' ],
  Smallr     => [ $ex   => 'http://smallr.com/2ne' ],
  SnipURL    => [ $ex   => 'http://snipurl.com/1vv5c' ],
  TinyURL    => [ $ex   => 'http://tinyurl.com/kotu' ],
  urlTea     => [ $ex   => 'http://urltea.com/1y' ],
  haojp      => [ $ex   => 'http://hao.jp/hb' ],
)}

sub extra_tests {(
  OneShortLink => [ $ex   => 'http://1sl.net/1239' ],
  Tinylink     => [ $ex_t => 'http://tinylink.com/?nlxzHox18M' ],
)}

1;
