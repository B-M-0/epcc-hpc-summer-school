FC = ftn
FFLAGS = -g -O2 -fopenmp

PROGRAMS = pi

all: $(PROGRAMS)

pi: pi.f90
	$(FC) $(FFLAGS) -o $@ $^

clean:
	rm -f $(PROGRAMS)
