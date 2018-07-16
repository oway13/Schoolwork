#include <errno.h>

#include "mm.h"

static int INT_SIZE = sizeof(int) * 8;  // size of int in bits

extern int errno;

/* Return usec */
double comp_time(struct timeval time_s, struct timeval time_e) {
  double elap = 0.0;

  if (time_e.tv_sec > time_s.tv_sec) {
    elap += (time_e.tv_sec - time_s.tv_sec - 1) * 1000000.0;
    elap += time_e.tv_usec + (1000000 - time_s.tv_usec);
  } else {
    elap = time_e.tv_usec - time_s.tv_usec;
  }
  return elap;
}

int mm_init(mm_t *mm, int hm, int sz) {
  mm->taken_size = hm / INT_SIZE + 1;

  // Allocate Memory and set slots to "free"
  if (!(mm->buf = malloc(hm * sz)) ||
      !(mm->taken_slots = (int *)calloc(hm, sizeof(int)))) {
    errno = ENOMEM;
    return -1;
  }

  // Set other attributes
  mm->next_free = mm->buf;
  mm->buf_end = (char *)mm->buf + hm * sz;
  mm->num_slots = hm;
  mm->slot_size = sz;
  return 0;
}

int get_buf_index(mm_t *mm, void *chunk) {
  return ((char *)chunk - (char *)mm->buf) / mm->slot_size;
}

int taken(mm_t *mm, void *chunk) {
  return mm->taken_slots[get_buf_index(mm, chunk)];
}

void *mm_get(mm_t *mm) {
  void *ret = mm->next_free;

  if (taken(mm, ret)) {
    // This shouldn't happen
    fprintf(stderr, "Error: Slot at %p is taken\n", ret);
    return NULL;
  }

  // Set taken bit for slot ret
  mm->taken_slots[get_buf_index(mm, ret)] = 1;

  // printf("Slot %d at buffer is now taken: %p\n", ret_index, ret);

  // Find next free slot
  int i;
  for (i = 0; i < mm->num_slots; i++) {
    if (!taken(mm, mm->next_free)) {
      break;
    }
    mm->next_free = (char *)mm->next_free + mm->slot_size;

    if (mm->next_free >= mm->buf_end) {
      mm->next_free = mm->buf;
    }
  }

  if (i == mm->num_slots) {
    errno = ENOMEM;
    return NULL;
  }

  return ret;
}

void mm_put(mm_t *mm, void *chunk) {
  mm->taken_slots[get_buf_index(mm, chunk)] = 0;
}

void mm_release(mm_t *mm) {
  free(mm->buf);
  free(mm->taken_slots);
}
