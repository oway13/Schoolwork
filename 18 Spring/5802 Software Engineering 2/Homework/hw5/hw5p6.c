#include <stdio.h>
#include <stdlib.h>

#define SWAP(a,b) { int _tmp = a; a = b; b = _tmp; }

int cur_count = 0;
int alloc_count = 0;
int total_count = 0;
int num_elems = 0;
int *counts;
int *psums;
int *elems;

void initialize(int n, FILE *fptr) {
    int i = 0;
    num_elems = n;
    counts = (int *) calloc(n, sizeof(int));
    psums = (int *) calloc(n, sizeof(int));
    elems = (int *) calloc(n, sizeof(int));
    for (i = 0; i < n; ++i) {
        elems[i] = i + 1;
        fscanf(fptr, "%d", &counts[i]);
        psums[i] = total_count += counts[i];
    }
}

int next_elem() {
    int top = num_elems - 1;
    int ret = elems[top];
    if (alloc_count >= total_count)
        return 0;
    ++alloc_count;
    ++cur_count;
    --psums[top];
    --counts[top];
    while (top > 0 && counts[top] <= (cur_count * psums[top - 1])) {
        psums[top - 1] += (counts[top] - counts[top - 1]);
        SWAP(counts[top], counts[top - 1]);
        SWAP(elems[top], elems[top - 1]);
        --top;
    }
    recordData();
    if (top != num_elems - 1)
        cur_count = 0;
    return ret;
}

int main() {
    int next;
    printf("number of elements: ");
    scanf("%d", &num_elems);
    printf("\nweights:\n");
    initialize(num_elems, stdin);
    printf("\n");
    while ((next = next_elem()) > 0)
        printf("%d ", next);
    printf("\n");
}

int recordData(){
   FILE* aggregated = fopen("./test_results.txt", "ab+");
   fprintf(aggregated, "counts = ");
   for (int i = 0; i < num_elems; i++) {
       fprintf(aggregated, "%d ", counts[i]);
   }
   fprintf(aggregated, "\nelems = ");
   for (int j = 0; j < num_elems; j++) {
       fprintf(aggregated, "%d ", elems[j]);
   }
   fprintf(aggregated, "\n");
   fclose(aggregated);
   return 0;
}
