require "nmatrix"

a = NMatrix.new(:dense, [3,4], [0,1,2,3,4,5,6,7,8,9,10,11], :float64)
b = NMatrix.new(:dense, [4,3], [-1,2,-3,4,-5,6,-7,8,-9,10,-11,12], :float64)
c = NMatrix.new(:dense, [3,3], :float64)

5000000.times do
  NMatrix::BLAS::cblas_gemm(:row, false, false, 3, 3, 4, 1.0, a, 4, b, 3, 0.0, c, 3)
end
