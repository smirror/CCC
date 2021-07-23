CFLAGS=-std=c11 -g -static

ccc: main.o

test: ccc
		./test.sh

clean:
		rm -f ccc *.o *~ tmp*

.PHONY: test clean
