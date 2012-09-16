CC      = gcc
CFLAGS  = -Wall -Wstrict-prototypes
SOURCES = net.c http.c
INCLUDE = crypto.h error.h ftp.h global.h http.h net.h
OBJECTS = $(SOURCES:.c=.o)
BIN     = libhttp.a

all:
	for i in $(SOURCES); do \
		$(CC) -c $$i $(CFLAGS) -o obj/$$i.o; \
	done

	ar rcs $(BIN) obj/*.o

	
clean:
	rm -rf obj/*
	rm $(BIN)
