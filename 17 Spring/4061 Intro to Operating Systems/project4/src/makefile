CC = gcc
CFLAGS = -D_REENTRANT -g -Wall
LDFLAGS = -lpthread -lm

web_server: server.c
	${CC} ${CFLAGS} -o web_server server.c util.o ${LDFLAGS}

clean:
	rm -f web_server web_server_log
