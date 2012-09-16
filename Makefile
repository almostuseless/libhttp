CC      = gcc
CFLAGS  = -Wall -Wstrict-prototypes
SOURCES = net.c http.c
INCLUDE = crypto.h error.h ftp.h global.h http.h net.h
OBJECTS = $(SOURCES:.c=.o)
BIN     = libhttp.so

all:
	for i in $(SOURCES); do \
		$(CC) $(CFLAGS) -c -fPIC $$i -o obj/$$i.o; \
	done

	gcc -shared -Wl,-soname,libhttp.so.1 -o $(BIN) obj/*.o
	
clean:
	rm -rf obj/*
	rm $(BIN)
