CXX=g++-4.7
LIBS=-llapack -lcblas -latlas

matmul: matmul.c
	${CXX} -I/usr/local/atlas/include -I/usr/local/atlas -I/usr/include -I/usr/include/atlas -L/usr/local/lib -L/usr/local/atlas -L/usr/local/atlas/lib ${LIBS} matmul.c -o matmul
