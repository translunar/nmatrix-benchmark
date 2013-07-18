extern "C" {
  #include <cblas.h>
}
#include <cstdio>

int main() {
  const double a[] = {0, 1, 2, 3, 
               4, 5, 6, 7, 
               8, 9, 10, 11};

  const double b[] = {-1, 2, -3,
                4, -5, 6,
                -7, 8, -9,
                10, -11, 12};

  int m = 3, k = 4, n = 3;
  double c[9];
  double alpha = 1.0;
  double beta = 0.0;

  cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, &(a[0]), k, &(b[0]), n, beta, &(c[0]), n);

  for (int i = 0; i < 9; i++) {
    std::printf("%f ", c[i]);
  }
  std::printf("\n");
}

