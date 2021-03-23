// Made by Edoardo Mantovani, 2021

#ifndef __CTXS_H
	#include "Ctxs.h"
#endif

#define AUTHOR EDOARDO_MANTOVANI
#define LINE_LEN 128


MODULE = RTE::Dump   PACKAGE = RTE::Dump
PROTOTYPES: DISABLE



void
rte_hexdump(f,  title,  buf,  len)
	FILE *f	
	const char * title
	const void * buf
	unsigned int len

  CODE:
	unsigned int i, out, ofs;
	const unsigned char *data = buf;
	char line[LINE_LEN];	
	fprintf(f, "%s at [%p], len=%u\n", title ? : "  Dump data", data, len);
	ofs = 0;
	while (ofs < len) {
		out = snprintf(line, LINE_LEN, "%08X:", ofs);
		for (i = 0; i < 16; i++) {
			if (ofs + i < len)
				snprintf(line + out, LINE_LEN - out,
					 " %02X", (data[ofs + i] & 0xff));
			else
				strcpy(line + out, "   ");
			out += 3;
		}


		for (; i <= 16; i++){
			out += snprintf(line + out, LINE_LEN - out, " | ");
			}
		for (i = 0; ofs < len && i < 16; i++, ofs++) {
			unsigned char c = data[ofs];

			if (c < ' ' || c > '~')
				c = '.';
			out += snprintf(line + out, LINE_LEN - out, "%c", c);
		}
		fprintf(f, "%s\n", line);
	}
	fflush(f);


void
rte_memdump(f, title, buf,  len)
	FILE *f
	const char *title
	const void *buf
	unsigned int len
  CODE:		
	unsigned int i, out;
	const unsigned char *data = buf;
	char line[LINE_LEN];

	if (title){
		fprintf(f, "%s: ", title);
	}
	line[0] = '\0';
	for (i = 0, out = 0; i < len; i++) {
		if (out >= LINE_LEN - 4) {
			fprintf(f, "%s", line);
			out = 0;
			line[out] = '\0';
		}
		out += snprintf(line + out, LINE_LEN - out, "%02x%s", (data[i] & 0xff), ((i + 1) < len) ? ":" : "");
	}
	if (out > 0)
		fprintf(f, "%s", line);
	fprintf(f, "\n");
	fflush(f);


char
rte_online_hexdump(title,  buf,  len)
	const char * title
	const void * buf
	unsigned int len
  CODE:
	unsigned int i, out, ofs;
	const unsigned char *data = buf;
	char line[LINE_LEN];	
	printf("%s at [%p], len=%u\n", title ? : "  Dump data", data, len);
	ofs = 0;
	while (ofs < len) {
		out = snprintf(line, LINE_LEN, "%08X:", ofs);
		for (i = 0; i < 16; i++) {
			if (ofs + i < len)
				snprintf(line + out, LINE_LEN - out,
					 " %02X", (data[ofs + i] & 0xff));
			else
				strcpy(line + out, "   ");
			out += 3;
		}


		for (; i <= 16; i++){
			out += snprintf(line + out, LINE_LEN - out, " | ");
			}
		for (i = 0; ofs < len && i < 16; i++, ofs++) {
			unsigned char c = data[ofs];

			if (c < ' ' || c > '~')
				c = '.';
			out += snprintf(line + out, LINE_LEN - out, "%c", c);
		}
		printf("%s\n", line);
	}
