# Made by Edoardo Mantovani,2020
# Test file dumper

use strict;
no strict 'subs';
no warnings;
use Test;

BEGIN{ plan tests => 2 }
use RTE::Dump qw( :dump_hex );

my $file = 'test.txt';
open(FILE, '>', $file);
rte_hexdump(\FILE, "test", \"0xFFFFF", 1024);


if(-e $file && ( -s $file != 0 ) ){ 
	print "test successfull!\n";	
	ok(1);
}else{
	return -1; # bad 	
}

ok(1);
