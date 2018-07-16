#ifndef __MM_H
#define __MM_H

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "mm.h"

// Interval for timer. Interval you need to send the packets to the receiver
#define INTERVAL 0
#define INTERVAL_USEC 50000

#define CHUNK_SIZE 64
#define NUM_CHUNKS 1000000

typedef struct {
  void *buf;        // The actual memory to be stored
  void *next_free;  // Pointer to next free chunk of memory
  void *buf_end;    // Pointer off end of allocated memory

  int num_slots;  // Number of slots in buf
  int slot_size;  // Size of each slot in buf

  int *taken_slots;  // Which slots are "free" according to the mm
  int taken_size;    // Size of taken_slots array
} mm_t;

double comp_time(struct timeval time_s, struct timeval time_e);
int mm_init(mm_t *mm, int num_chunks, int chunk_size);
void *mm_get(mm_t *mm);              // "malloc"
void mm_put(mm_t *mm, void *chunk);  // "free"
void mm_release(mm_t *mm);

#endif
