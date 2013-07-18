require "nmatrix"

a = NMatrix.new(:dense, [3,4], [0,1,2,3,4,5,6,7,8,9,10,11], :float64)
b = NMatrix.new(:dense, [4,3], [-1,2,-3,4,-5,6,-7,8,-9,10,-11,12], :float64)

5000000.times do
  c = NMatrix.new(:dense, [3,3], :float64)
end