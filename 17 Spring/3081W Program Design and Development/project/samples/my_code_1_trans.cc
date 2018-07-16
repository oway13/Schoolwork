#include <iostream>
#include "include/Matrix.h"
#include <math.h>
using namespace std;
int main ( ) {
    matrix m ( matrix::matrix_read ("./samples/sample_matrix_1.data" ) );
    matrix n ( matrix::matrix_read ("./samples/sample_matrix_2.data" ) );
    
    m = m * n;
    
    cout << m ;
}
