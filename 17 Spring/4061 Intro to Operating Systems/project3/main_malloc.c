/* CSCI4061 S2017 Assignment 3
 * login: kormi001
 * date: 04/12/17
 * name: Vy Le, Wyatt Kormick, Jon Huhn
 * id: lexxx600, kormi001, huhnx025
 */
#include "mm.h"

void main() {
  void *test[NUM_CHUNKS];

  struct timeval time_s, time_e;

  /* start malloc timer */
  gettimeofday(&time_s, NULL);

  for (int i = 0; i < NUM_CHUNKS; i++) {
    test[i] = malloc(CHUNK_SIZE);
  }

  for (int i = 0; i < NUM_CHUNKS; i++) {
    free(test[i]);
  }

  gettimeofday(&time_e, NULL);

  fprintf(stderr, "Time taken = %f msec\n", comp_time(time_s, time_e) / 1000.0);
}
