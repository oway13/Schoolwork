/* CSCI4061 S2017 Assignment 3
 * login: kormi001
 * date: 04/12/17
 * name: Vy Le, Wyatt Kormick, Jon Huhn
 * id: lexxx600, kormi001, huhnx025
 */
#include "mm.h"

void main() {
  mm_t mm;

  if (mm_init(&mm, NUM_CHUNKS, CHUNK_SIZE) < 0) {
    perror("Could not initialize memory");
    exit(-1);
  }

  struct timeval time_s, time_e;

  /* start malloc timer */
  gettimeofday(&time_s, NULL);

  void *temp;
  for (int i = 0; i < NUM_CHUNKS; i++) {
    temp = mm_get(&mm);
  }

  for (int i = 0; i < NUM_CHUNKS; i++) {
    temp = (char *)mm.buf + CHUNK_SIZE * i;
    mm_put(&mm, temp);
  }

  gettimeofday(&time_e, NULL);

  fprintf(stderr, "Time taken = %f msec\n", comp_time(time_s, time_e) / 1000.0);
}
