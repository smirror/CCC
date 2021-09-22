CFLAGS=-std=c17 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

gccc: $(OBJS)
		$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

cccc: $(OBJS)
		clang $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJS): ccc.h

gtest: gccc
		./test.sh

ctest: cccc
		./test.sh

test: ctest gtest

clean:
		rm -f ccc *.o *~ tmp*

.PHONY: test clean
