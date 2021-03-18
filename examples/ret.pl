#!/usr/bin/perl

sub BEGIN{

no strict;
no warnings;
use RTE::Dump qw(:dump_hex);

# do something, trigger the perl :V


my $file = 'dumper.txt';

open(FILE, '>', $file);

print rte_hexdump(\FILE, "AAAAAA", "0x999999999", 22000);

}
