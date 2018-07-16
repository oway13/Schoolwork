CC=gcc
CFLAGS=-g

SRC=$(wildcard *.c) $(wildcard *.h)
SUB=project3-submission

A=main_mm main_malloc
B=packet_sender packet_receiver

all: A B

A: main_mm main_malloc
B: packet_sender packet_receiver

main_mm: mm.o main_mm.c
	$(CC) $(CFLAGS) $^ -o $@

main_malloc: mm.o main_malloc.c
	$(CC) $(CFLAGS) $^ -o $@

packet_sender: mm.o packet.h packet_sender.c
	$(CC) $(CFLAGS) $^ -o $@

packet_receiver: mm.o packet.h packet_receiver.c
	$(CC) $(CFLAGS) $^ -o $@

mm.o: mm.c mm.h
	$(CC) $(CFLAGS) -c mm.c -o $@

.PHONY: clean A B submission

submission:
	mkdir -p $(SUB)
	cp $(SRC) Makefile README.txt $(SUB)/
	tar czvf $(SUB).tar.gz $(SUB)/
	rm -rf $(SUB)/

clean:
	rm -f mm.o main_mm main_malloc packet_sender packet_receiver $(SUB).tar.gz
