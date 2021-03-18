**RTE::DUMP**
====================================================

<img src="https://media.giphy.com/media/cHLLRNVaqALxCv1Kgb/giphy.gif" alt="drawing" width="2000"/>

![license](https://img.shields.io/github/license/Baseband-processor/RTE-Dump) ![size](https://img.shields.io/github/languages/code-size/Baseband-processor/RTE-Dump)  ![release-date](https://img.shields.io/github/release-date/Baseband-processor/RTE-Dump)

**WHO I AM?**

Click [Here](https://github.com/Baseband-processor/Baseband-processor)


**BASIC DOCUMENTATION**

while I was working on dpdk, I found a file named _rte_hexdump.h_ which had only two functions, both had been implemented in this simple library which is usefull for dumping memory data regions in _hexdump_ style.


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

print rte_online_hexdump("", \"0xfff", "4096");
```

and the output is:

```
 at [0x9b54a59], len=4096
00000000: 53 43 41 4C 41 52 28 30 78 39 61 66 39 35 61 30 | SCALAR(0x9af95a0
00000010: 29 00 00 31 00 00 00 2F 75 73 72 2F 73 68 61 72 | )..1.../usr/shar
00000020: 65 2F 70 65 72 6C 2F 35 2E 32 32 2F 45 78 70 6F | e/perl/5.22/Expo
00000030: 72 74 65 72 2F 48 65 61 76 79 2E 70 6D 00 00 00 | rter/Heavy.pm...
00000040: 00 00 00 31 00 00 00 2F 75 73 72 2F 73 68 61 72 | ...1.../usr/shar
00000050: 65 2F 70 65 72 6C 2F 35 2E 32 32 2F 45 78 70 6F | e/perl/5.22/Expo
00000060: 72 74 65 72 2F 48 65 61 76 79 2E 70 6D 00 00 00 | rter/Heavy.pm...
00000070: 00 00 00 11 00 00 00 2F 0A 00 B7 C8 A7 EA B7 00 | ......./........
00000080: 00 00 00 11 00 00 00 20 00 00 00 30 46 B5 09 10 | ....... ...0F...
00000090: 00 00 00 11 00 00 00 22 00 EA B7 B0 A7 EA B7 00 | ......."........
000000A0: 00 00 00 29 00 00 00 78 49 B5 09 30 4E B7 09 2F | ...)...xI..0N../
000000B0: 00 00 00 00 00 00 00 30 00 00 00 00 00 00 00 00 | .......0........
000000C0: 00 00 00 00 00 00 00 28 00 00 00 20 00 00 00 22 | .......(... ..."
000000D0: 20 69 73 20 6E 6F 74 20 64 65 66 69 6E 65 64 20 |  is not defined 
000000E0: 69 6E 20 25 00 00 00 00 00 00 00 31 00 00 00 2F | in %.......1.../
000000F0: 75 73 72 2F 73 68 61 72 65 2F 70 65 72 6C 2F 35 | usr/share/perl/5
00000100: 2E 32 32 2F 45 78 70 6F 72 74 65 72 2F 48 65 61 | .22/Exporter/Hea
00000110: 76 79 2E 70 6D 00 09 38 E3 B6 09 11 00 00 00 64 | vy.pm..8.......d
00000120: 65 6C 00 72 74 20 00 48 00 AD 09 11 00 00 00 61 | el.rt .H.......a
00000130: 64 64 00 10 A8 EA B7 F4 00 B6 09 11 00 00 00 00 | dd..............
00000140: 48 B7 09 B0 A7 EA B7 44 00 B6 09 19 00 00 00 28 | H......D.......(
00000150: 3F 5E 3A 5E 5C 64 29 00 00 00 00 00 00 00 00 00 | ?^:^\d).........
00000160: 00 00 00 31 00 00 00 2F 75 73 72 2F 73 68 61 72 | ...1.../usr/shar
00000170: 65 2F 70 65 72 6C 2F 35 2E 32 32 2F 45 78 70 6F | e/perl/5.22/Expo
00000180: 72 74 65 72 2F 48 65 61 76 79 2E 70 6D 00 B7 30 | rter/Heavy.pm..0
00000190: 00 00 00 39 00 00 00 2F 75 73 72 2F 73 68 61 72 | ...9.../usr/shar
000001A0: 65 2F 70 65 72 6C 2F 35 2E 32 32 2F 45 78 70 6F | e/perl/5.22/Expo
000001B0: 72 74 65 72 2F 48 65 61 76 79 2E 70 6D 00 09 00 | rter/Heavy.pm...
000001C0: 00 00 00 00 00 00 00 38 00 00 00 E9 01 00 00 F0 | .......8........
000001D0: B0 AD 09 F0 B0 AD 09 D8 5E B1 09 00 00 00 00 F0 | ........^.......
000001E0: B0 AD 09 00 00 00 00 00 00 00 00 F0 B0 AD 09 00 | ................
000001F0: 00 00 00 00 00 00 00 00 00 00 00 F0 B0 AD 09 00 | ................
00000200: 00 00 00 F0 B0 AD 09 00 00 00 00 00 00 00 00 F0 | ................
00000210: B0 AD 09 00 00 00 00 00 00 00 00 00 00 00 00 00 | ................
00000220: 00 00 00 F0 B0 AD 09 F0 B0 AD 09 F0 B0 AD 09 00 | ................
00000230: 00 00 00 00 00 00 00 00 00 00 00 F0 B0 AD 09 F0 | ................
00000240: B0 AD 09 00 00 00 00 00 00 00 00 F0 B0 AD 09 F0 | ................

# etc etc etc

```


**REQUIREMENTS**

- [x] perl
- [x] gcc or another C compiler

**INSTALLATION**

for installing RTE::Dump simply execute:

```shell

sudo perl Makefile.PL
sudo make
sudo make test
sudo make install

```

**EXPORTED FUNCTIONS**

for now are implement only 3 functions:

* rte_hexdump
* rte_memdump 
* rte_online_hexdump


**FUTURE DIRECTIONS**

This module won't die here, this is only the first starting point, hope to update monthly.


**Requests and collaborations**

Feel free to email me at <Baseband@cpan.org>
- [x] I am open for suggestions, code improvement, collaboration and other requests

**COPYRIGHT AND LICENCE**


BSD 2-Clause License

Copyright (c) 2020, Edoardo Mantovani
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

_THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE._

<img src="https://media.giphy.com/media/cHLLRNVaqALxCv1Kgb/giphy.gif" alt="drawing" width="2000"/>
