/*******************************************************************************
 * Name             : matrix.h
 * Project          : fcal
 * Module           : Matrix class
 * Description      : Implemenation of the Matrix class
 * Copyright        : 2017 CSCI3081W Staff. All rights reserved.
 * Creation Date    : 4/21/17
 * Original Authors : Wyatt Kormick, Andrew Johnson
 ******************************************************************************/

#ifndef PROJECT_INCLUDE_MATRIX_H_
#define PROJECT_INCLUDE_MATRIX_H_

#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <iostream>
#include <fstream>
#include <string>

class matrix {
 public:
    matrix(int i, int j);
    matrix(const matrix& m);
    ~matrix();

    int n_rows( ) const {return rows;}
    int n_cols( ) const {return cols;}
    float *access(const int i, const int j) const {return &data[i][j];}
    matrix operator*(const matrix &right_matrix);
    void operator=(const matrix &right_matrix);
    friend std::ostream& operator<<(std::ostream &os, matrix &m);

    static matrix matrix_read(std::string filename);

 private:
    matrix() { }
    int rows;
    int cols;

    /* Your implementation of "data" may vary.  There are ways in
       which data can be an array of arrays and thus simplify the
       access method, at the cost of complicating the process of
       allocating space for data.  The choice is entirely up to
       you. */
    float **data;
};

#endif  // PROJECT_INCLUDE_MATRIX_H_
