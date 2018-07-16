/*******************************************************************************
 * Name             : matrix.cc
 * Project          : fcal
 * Module           : Matrix class
 * Description      : Implemenation of the Matrix class
 * Copyright        : 2017 CSCI3081W Staff. All rights reserved.
 * Creation Date    : 4/21/17
 * Original Authors : Wyatt Kormick, Andrew Johnson
 ******************************************************************************/

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "include/Matrix.h"
#include <iostream>
#include <string>

/*******************************************************************************
 * Constructors/Destructor
 ******************************************************************************/
matrix::matrix(int i, int j) {
  rows = i;
  cols = j;
  data = new float*[i];
  for (int k = 0; k < i; k++) {
    data[k] = new float[j];
  }
}  // Matrix Constructor
matrix::matrix(const matrix& m) {
  rows = m.n_rows();
  cols = m.n_cols();
  data = new float*[rows];
  for (int k = 0; k < rows; k++) {
    data[k] = new float[cols];
  }
}  // Matrix Copy Constructor
matrix::~matrix() {
  for (int k = 0; k < rows; k++) {
    delete(data[k]);
  }
  delete(data);
}  // Matrix Destructor

/*******************************************************************************
  * Functions
******************************************************************************/
matrix matrix::operator*(const matrix &right_matrix) {
  int lhs_rows = n_rows();
  int lhs_cols = n_cols();
  int rhs_rows = right_matrix.n_rows();
  int rhs_cols = right_matrix.n_cols();
  float sum;
  if (lhs_cols != rhs_rows) {
    std::cout << "LHS Cols != RHS Rows\n";
    exit(1);
  }
  matrix result_matrix(lhs_rows, rhs_cols);
  for (int i = 0; i < lhs_rows; i++) {
    for (int j = 0; j < rhs_cols; j++) {
      sum = 0.0;
      for (int k = 0; k < lhs_cols; k++) {
        sum = sum + *access(i, k)*(*(right_matrix.access(k, j)));
      }
      *(result_matrix.access(i, j)) = sum;
    }
  }
  return result_matrix;
}  // operator*

void matrix::operator=(const matrix &right_matrix) {
  if (data != right_matrix.data) {
    if (data != 0) {
      for (int k = 0; k < rows; k++) {
        delete(data[k]);
      }
      delete(data);
    }
    rows = right_matrix.rows;
    cols = right_matrix.cols;
    data = new float*[rows];
    for (int k = 0; k < rows; k++) {
      data[k] = new float[cols];
    }
  }
}  // operator=
std::ostream& operator<<(std::ostream &os, matrix &m) {
  os << m.rows << " " << m.cols << std::endl;
  for (int i = 0; i < m.rows; i++) {
    for (int j = 0; j < m.cols; j++) {
      os << m.data[i][j] << "  ";
    }
    os << "\n";
  }
  return os;
}  // operator<<

matrix matrix::matrix_read(std::string filename) {
  std::ifstream matrix_file;
  matrix_file.open(filename.c_str());
  int line_count;
  int line_length;
  float new_entry;
  matrix_file >> line_count >> line_length;
  matrix result_matrix(line_count, line_length);
  for (int i = 0; i < line_count; i++) {
    for (int j = 0; j < line_length; j++) {
      matrix_file >> new_entry;
      *(result_matrix.access(i, j)) = new_entry;
    }
  }
  matrix_file.close();
  return result_matrix;
}  // matrix_read
