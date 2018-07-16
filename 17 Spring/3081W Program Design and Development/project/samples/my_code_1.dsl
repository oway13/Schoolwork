/* Reads in two matrices and multiplies them together */

main () {

matrix m = matrix_read( "./samples/sample_matrix_1.data" );
matrix n = matrix_read( "./samples/sample_matrix_2.data" );

matrix x = m * n;

print ( x );

}
