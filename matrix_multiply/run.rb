require 'nmatrix'
require 'matrix'
require 'benchmark'

n = 50000
a = NMatrix.new(:dense, [3,4], [0,1,2,3,4,5,6,7,8,9,10,11], :float64)
b = NMatrix.new(:dense, [4,3], [-1,2,-3,4,-5,6,-7,8,-9,10,-11,12], :float64)
c = NMatrix.new(:dense, [3,3], :float64) # uninitialized

rb_a = Matrix[ [0.0,1.0,2.0,3.0], [4.0,5.0,6.0,7.0], [8.0,9.0,10.0,11.0] ]
rb_b = Matrix[ [-1.0,2.0,-3.0], [4.0,-5.0,6.0], [-7.0,8.0,-9.0], [10.0,-11.0,12.0] ]

unless File.exists?("matmul")
  raise("Need to compile matmul first! Type `make` and ensure there are no errors.")
end

# 1: Matrix multiplication: NMatrix versus C++
Benchmark.bm(30) do |x|
  x.report("C++:") { 1.times { `./matmul`} }
  x.report("NMatrix baseline x10") { 10.times { `ruby nmatrix_baseline.rb` } }
  x.report("NMatrix::BLAS") { 1.times { `ruby blas_dgemm.rb` } }
  x.report("NMatrix#dot") { 1.times { `ruby nmatrix_dot.rb` } }
  x.report("NMatrix#dot baseline1") { 1.times { `ruby nmatrix_dot_baseline1.rb` } }
  x.report("NMatrix#dot baseline2") { 1.times { `ruby nmatrix_dot_baseline2.rb` } }
  x.report("NMatrix#dot baseline3") { 1.times { `ruby nmatrix_dot_baseline3.rb` } }
  x.report("Matrix baseline") { 1.times { `ruby matrix_baseline.rb` } }
  x.report("Matrix") { 1.times { `ruby matrix.rb` } }
end
