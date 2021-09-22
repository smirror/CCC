CFLAGS=-std=c17 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

gccc: $(OBJS)
		$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

cccc: $(OBJS)
		clang $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJS): ccc.h

gtest: clean gccc
		./test.sh

ctest: clean cccc
		./test.sh

test: gtest ctest

clean:
		rm -f ccc cccc gccc *.o *~ tmp*

.PHONY: test clean
