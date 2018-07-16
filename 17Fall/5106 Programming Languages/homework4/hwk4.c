#include <stdio.h>

int A[];
int partition(int, int, int);

int main(void) {
	//Initial Testing
	// for(int a = 0; a <= 110; a = a+10){
	//
	// 	printf("pivot value: %d\n", a);
	// 	int b = partition(0, 9, a);
	// 	printf("i = %d\n", b);
	// 	for(int c = 0; c < 10; c++){
	// 	  printf("%d ", A[c]);
	// 		if(c == b){
	// 			printf("| ");
	// 		}
	// 	}
	// 	printf("\n__________________\n");
	// }

	return 0;
}

int partition(int m, int n, int v){
    int i = m - 1; int k = m;
    int t;
    while(k <= n){ //While length A[k..n] > 0
        if(A[k] < v){
            i++;
            t = A[i]; A[i] = A[k]; A[k] = t; //Swap A[k] and what was A[i+1]
        }
        k++;
    }
    return i;
}
