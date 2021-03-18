#!/usr/bin/perl

# Made by Edoardo Mantovani,2020
# Test online Dump

use strict;
use warnings;
use Test;
BEGIN{ plan tests => 1 }
use RTE::Dump qw(:dump_hex);

print rte_online_hexdump("", \"0xfff", "4096");

ok(1);
