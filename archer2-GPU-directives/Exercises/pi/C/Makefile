CC = cc
CFLAGS = -g -Ofast -fopenmp

PROGRAMS = pi

all: $(PROGRAMS)

pi: pi.c
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(PROGRAMS)
