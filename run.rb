require 'nmatrix'
require 'matrix'
require 'benchmark'

n = 50000
a = NMatrix.new(:dense, [3,4], [0,1,2,3,4,5,6,7,8,9,10,11], :float64)
b = NMatrix.new(:dense, [4,3], [-1,2,-3,4,-5,6,-7,8,-9,10,-11,12], :float64)
c = NMatrix.new(:dense, [3,3], :float64) # uninitialized

rb_a = Matrix[ [0.0,1.0,2.0,3.0], [4.0,5.0,6.0,7.0], [8.0,9.0,10.0,11.0] ]
rb_b = Matrix[ [-1.0,2.0,-3.0], [4.0,-5.0,6.0], [-7.0,8.0,-9.0], [10.0,-11.0,12.0] ]

#unless File.exists?("matmul")
#  raise("Need to compile matmul first! Type `make` and ensure there are no errors.")
#end

# 1: Matrix multiplication: NMatrix versus C++
Benchmark.bm(20) do |x|
  #x.report("C++:") { n.times { `./matmul`} }
  x.report("NMatrix::BLAS") { n.times { NMatrix::BLAS::cblas_gemm(:row, false, false, 3, 3, 4, 1.0, a, 4, b, 3, 0.0, c, 3) } }
  x.report("NMatrix#dot") { n.times { a.dot(b) } }
  x.report("Ruby Matrix") { n.times { rb_a * rb_b } }
end
