CFLAGS=-std=c17 -g -static

ccc: main.o
		$(CC) -o $@ $? $(LDFLAGS)

test: ccc
		./test.sh

clean:
		rm -f ccc *.o *~ tmp*

.PHONY: test clean
