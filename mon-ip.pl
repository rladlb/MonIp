#!/usr/bin/perl
use strict;
use warnings;
use LWP;

my $browser = LWP::UserAgent->new;
$browser->agent( 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0' );

my $url = 'http://www.mon-ip.com';
my $response = $browser->get($url);
die "Can't get $url -- ", $response->status_line unless $response->is_success;
my $html = $response->content;

while ($html =~ /.*"([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/g) {
    print "$1\n";
    exit()
}

