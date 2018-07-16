#ifndef PACKET_H
#define PACKET_H

#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <unistd.h>

#include "mm.h"

#define MAX_PACKETS 10 /* Max packets allowed in the message */
#define PACKET_SIZE 3
#define MSGSIZE 128
#define key 4061 /* key which will be used for identifying the queue */
#define QUEUE_MSG_TYPE                                                   \
  1 /* message type for queue messages. Send receive only these types of \
       messages from the queue */

typedef char data_t[PACKET_SIZE];

typedef struct {
  int how_many; /* number of packets in the message */
  int seqnum;   /* sequence number for the packet in the message */
  data_t data;  /* packet data */
  int which;
} packet_t;

/* Keeps track of packets that have arrived for the message */
typedef struct {
  int num_packets;
  void *data[MAX_PACKETS];
} message_t;

/* The queue message used to send the pid */
typedef struct {
  long mtype;
  int pid;
} pid_queue_msg;

/* The queue message used to send the packets */
typedef struct {
  long mtype;
  packet_t pkt;
} packet_queue_msg;

#endif
