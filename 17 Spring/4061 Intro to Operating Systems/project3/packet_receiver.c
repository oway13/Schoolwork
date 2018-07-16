/* CSCI4061 S2017 Assignment 3
 * login: kormi001
 * date: 04/12/17
 * name: Vy Le, Wyatt Kormick, Jon Huhn
 * id: lexxx600, kormi001, huhnx025
 */

#include <string.h>
#include "packet.h"

extern int errno;

int msqid = -1;

static message_t message; /* current message structure */
static mm_t mm;           /* memory manager will allocate memory for packets */
static int pkt_cnt = 0; /* how many packets have arrived for current message */
static int pkt_total = 1; /* how many packets to be received for the message */

/*
 * Handles the incoming packet. Store the packet in a chunk from memory manager.
 * The packets for given message will come out of order. Hence you need to take
 * care to store and assemble it correctly. Example, message "aaabbb" can come
 * as bbb -> aaa, hence, you need to assemble it as aaabbb. Hint: "which" field
 * in the packet will be useful.
 */
static void packet_handler(int sig) {
  packet_queue_msg pktmsg;

  // Get the "packet_queue_msg" from the queue.
  if (msgrcv(msqid, &pktmsg, sizeof(packet_t), QUEUE_MSG_TYPE, 0) < 0) {
    perror("Error receiving packet");
    exit(-1);
  }

  // Put packet in correct position in current message's data
  packet_t pkt = pktmsg.pkt;
  message.data[pkt.which] = mm_get(&mm);
  if (!message.data[pkt.which]) {
    perror("Could not allocate data for message");
    exit(-1);
  }
  memcpy(message.data[pkt.which], &pkt, sizeof(pkt));

  // Set globals
  pkt_cnt++;
  pkt_total = pkt.how_many;
  message.num_packets = pkt.how_many;
}

/*
 * Create message from packets ... deallocate packets.
 * Return a pointer to the message on success, or NULL
 */
static char *assemble_message() {
  // printf("Assembling message with %d packets\n", message.num_packets);
  char *msg;

  // +1 for '\0'
  int msg_len = message.num_packets * sizeof(data_t) + 1;

  /* Allocate msg and assemble packets into it */
  msg = (char *)malloc(msg_len);
  if (!msg) {  // Check if malloc failed
    errno = ENOMEM;
    return NULL;
  }

  // msg_i indexes into the msg to be returned
  char *msg_i = msg;
  for (int i = 0; i < message.num_packets; i++) {
    packet_t *packet = message.data[i];
    strncpy(msg_i, packet->data, PACKET_SIZE);
    msg_i += PACKET_SIZE;
  }
  msg[msg_len - 1] = '\0';

  // Free memory for next message
  for (int j = 0; j < message.num_packets; j++) {
    mm_put(&mm, message.data[j]);
  }

  /* reset these for next message */
  pkt_total = 1;
  pkt_cnt = 0;
  message.num_packets = 0;

  return msg;
}

int main(int argc, char **argv) {
  if (argc != 2) {
    printf("Usage: packet_sender <num of messages to receive>\n");
    exit(-1);
  }

  int k = atoi(argv[1]); /* no of messages you will get from the sender */
  int i;
  char *msg;
  pid_queue_msg pid = {QUEUE_MSG_TYPE, getpid()};

  /* Init memory manager for NUM_CHUNKS chunks of size CHUNK_SIZE each */
  mm_init(&mm, NUM_CHUNKS, CHUNK_SIZE);
  message.num_packets = 0;

  /* Initialize msqid to send pid and receive messages from the message queue.
   * Use the key in packet.h */
  msqid = msgget(key, 0666);

  /* Send process pid to the sender on the queue */
  printf("Sending pid: %d\n", pid.pid);
  if (msgsnd(msqid, &pid, sizeof(pid_queue_msg), 0) < 0) {
    perror("Error sending pid to sender");
    exit(-1);
  }

  /* Set up SIGIO handler to read incoming packets from the queue. Check
   * packet_handler()*/
  struct sigaction act;
  sigemptyset(&act.sa_mask);
  sigaddset(&act.sa_mask, SIGIO);
  act.sa_handler = packet_handler;
  sigaction(SIGIO, &act, NULL);

  for (i = 1; i <= k; i++) {
    while (pkt_cnt < pkt_total) {
      pause(); /* block until next packet */
    }

    msg = assemble_message();
    if (msg == NULL) {
      perror("Failed to assemble message");
    } else {
      fprintf(stderr, "GOT IT: message=%s\n", msg);
      free(msg);
    }
  }

  // Deallocate memory manager
  mm_release(&mm);

  // Remove the queue once done
  msgctl(msqid, IPC_RMID, 0);

  return EXIT_SUCCESS;
}
