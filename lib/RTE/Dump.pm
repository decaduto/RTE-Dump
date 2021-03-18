package RTE::Dump;


# Made by Edoardo Mantovani,2020
# initial release

use strict;
use warnings;

our $VERSION = '0.20';
use base qw(Exporter DynaLoader);

our %EXPORT_TAGS = (
   dump_hex => [qw(
	rte_hexdump
        rte_memdump
	rte_online_hexdump
   )],
);

our @EXPORT = (
   @{ $EXPORT_TAGS{dump_hex} },

);



__PACKAGE__->bootstrap($VERSION);


1;

__END__

=head1 NAME
RTE::Dump A practical way for dumping data  in a stylish way

=head1 SYNOPSIS

**BASIC DOCUMENTATION**

while I was working on dpdk, I found a file named _rte_hexdump.h_ which had only two functions, both had been implemented here.

The suggested use is for dumping memory and printing it to a file.


RTE_HEXDUMP
===============================

**SYNTAX**

As documented also on _rte_hexdump.h_ the functions parameters are 4:

* the pointer of the filehandle

* the "title" of the dump

* the buffer address to print out

* The number of bytes to dump out

**EXAMPLE**

this small example show the entire functionality of the library (for now):

```perl

#!/usr/bin/perl

no strict;
use RTE::Dump qw(:dump_hex);

my $file = 'dumper.txt';

open(FILE, '>', $file);

print rte_hexdump(\FILE, "", \"0xFFFFF", 4096);


```

and the format of the dumper.txt file is:

```
AAAAAA at [0x99c6fa0], len=22000
00000000: 30 78 39 39 39 39 39 39 39 39 39 00 00 00 00 00 | 0x999999999.....
00000010: F0 00 9A 09 31 00 00 00 00 00 00 00 00 00 00 00 | ....1...........
00000020: 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 | ................
00000030: 00 00 00 00 00 00 00 00 9C E4 9B 09 03 00 00 00 | ................
00000040: 24 B4 9B 09 19 00 00 00 01 00 00 00 98 12 9F 09 | $...............
00000050: 1E 00 00 00 0E 00 00 00 00 00 00 00 11 00 00 00 | ................
00000060: 50 B0 9C 09 F8 3B 9F 09 10 00 00 00 29 00 00 00 | P....;......)...
00000070: 06 B7 9D 09 A8 CA 9C 09 00 00 00 00 00 00 00 00 | ................
00000080: 00 00 00 00 01 00 00 00 00 00 00 00 09 11 00 00 | ................
00000090: 00 00 00 00 29 00 00 00 56 70 9C 09 00 00 00 00 | ....)...Vp......
000000A0: 00 00 00 00 70 00 00 00 7B 00 00 00 01 00 00 00 | ....p...{.......
000000B0: FF FF FF 7F 05 00 24 77 6F 72 64 00 29 00 00 00 | ......$word.)...
000000C0: 2F 75 73 72 2F 73 68 61 72 65 2F 70 65 72 6C 2F | /usr/share/perl/
000000D0: 35 2E 32 32 2F 77 61 72 6E 69 6E 67 73 2E 70 6D | 5.22/warnings.pm
000000E0: 00 00 00 00 29 00 00 00 2F 75 73 72 2F 73 68 61 | ....).../usr/sha
000000F0: 72 65 2F 70 65 72 6C 2F 35 2E 32 32 2F 77 61 72 | re/perl/5.22/war
00000100: 6E 69 6E 67 73 2E 70 6D 00 00 00 00 89 00 00 00 | nings.pm........
00000110: B4 00 9A 09 DC 00 9A 09 C8 00 9A 09 9C B0 A3 09 | ................
00000120: DC C3 9C 09 04 50 A3 09 2C 50 A3 09 B4 00 9A 09 | .....P..,P......
00000130: B4 00 9A 09 B4 00 9A 09 2C C9 9C 09 B4 00 9A 09 | ........,.......
00000140: B4 00 9A 09 00 00 00 00 00 00 00 00 00 00 00 00 | ................
00000150: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 | ................
00000160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 | ................
00000170: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 | ................
00000180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 | ................
00000190: 00 00 00 00 C1 07 00 00 4A 01 00 00 01 00 00 00 | ........J.......
000001A0: 80 04 9A 09 00 00 00 00 05 00 00 00 00 00 00 00 | ................
000001B0: 00 00 00 00 00 00 00 00 00 00 00 00 70 DE 9B 09 | ............p...
000001C0: 00 00 00 00 34 5A CC BF AB AB AB AB 28 01 00 01 | ....4Z......(...
000001D0: 00 00 00 00 80 04 9A 09 00 00 00 00 06 00 00 00 | ................

```

RTE_MEMDUMP
=================================
**SYNTAX**

As documented also on _rte_hexdump.h_ the functions parameters are 4:

* the pointer of the filehandle

* the "title" of the dump

* the buffer address to print out

* The number of bytes to dump out

Dump out memory in a hex format with colons between bytes

**EXAMPLE**


```perl                                                                    

#!/usr/bin/perl

no strict;
use RTE::Dump qw(:dump_hex);

my $file = 'dumper.txt';

open(FILE, '>', $file);

print rte_memdump(\FILE, undef, \"0xFFFF", 220);



```

and the format of the dumper.txt file is:


```
: 53:43:41:4c:41:52:28:30:78:39:64:37:66:66:64:38:29:00:00:19:00:00:00:28:3f:5e:3a:5e:5c:64:29:00:00:00:00:00:00:00:00:00:00:00:00:31:00:00:00:2f:75:73:72:2f:73:68:61:72:65:2f:70:65:72:6c:2f:35:2e:32:32:2f:45:78:70:6f:72:74:65:72:2f:48:65:61:76:79:2e:70:6d:00:09:18:70:de:09:11:00:00:00:2c:20:00:00:2e:70:6d:00:10:00:00:00:11:00:00:00:2f:00:d8:09:2a:29:2f:24:00:e7:dc:09:59:00:00:00:00:00:00:00:0d:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:9c:00:00:00:00:02:01:00:01:1f:02:00:2f:00:00:00:00:31:02:00:01:00:00:00:00:2a:02:00:00:10:00:00:00:32:02:00:01:00:00:00:01:1f:02:00:2f:04:00:00:00:04:01:00:00:00:00:00:00:00:00:00:49:00:00:00:01:00:00:00:00


```

RTE_ONLINE_HEXDUMP
=======================================

**SYNTAX**

the parameters are:

* the "title" of the dump

* the buffer address to print out

* The number of bytes to dump out

This is the first independent C function implemented for this library.

**EXAMPLE**

```perl
#!/usr/bin/perl

no strict;
no warnings;

use RTE::Dump qw(:dump_hex);

print rte_online_hexdump("", \"0xFFFFF", 4096);
```

and the output is:

```
00000000: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | SCALAR(0x9b8151c
00000010: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | )......(........
00000130: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...9.../usr/lib/
00000140: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | i386-linux-gnu/p
00000150: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | erl/5.22/DynaLoa
00000160: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | der.pm..1..9.../
00000170: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | usr/lib/i386-lin
00000180: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ux-gnu/perl/5.22
00000190: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | /DynaLoader.pm..
000001A0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...)....5.......
000001B0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...S...X........
000001C0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | .....$file..... 
000001D0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | for .irsep$name.
000001E0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 1.......... z...
000001F0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...........9.../
00000200: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | usr/lib/i386-lin
00000210: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ux-gnu/perl/5.22
00000220: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | /DynaLoader.pm..
00000230: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...)........\e..
00000240: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | .......r fo....@
00000250: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | arg.:..........d
00000260: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | l_expandspec(..H
00000270: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | Z......) => ...H
00000280: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | Z..HZ..0...9.../
00000290: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | usr/lib/i386-lin
000002A0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ux-gnu/perl/5.22
000002B0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | /DynaLoader.pm..
000002C0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...9.../usr/lib/
000002D0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | i386-linux-gnu/p
000002E0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | erl/5.22/DynaLoa
000002F0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | der.pm..b......@
00000300: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...(].......... 
00000310: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | checking in ....
00000320: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...........HZ...
00000330: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ............j..^
00000340: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...C........ ..4
00000840: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | p.......F......6
00000850: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ....n......f....
00000860: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ........<......<
00000870: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | <......`........
00000880: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ....<...<...<...
00000890: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ...8=...<..pp...
000008A0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ....F......6...h
00000FF0: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | .F.,D..PD..HD...
```

**EXPORTED FUNCTIONS**

for now are implement only 3 functions:

* rte_hexdump
* rte_memdump 
* rte_online_hexdump


=head1 AUTHOR
 
<lt>Edoardo Mantovani<gt> 
  
=head1 COPYRIGHT AND LICENSE


Copyright (C) 2020 by Edoardo Mantovani, aka BASEBAND

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.
