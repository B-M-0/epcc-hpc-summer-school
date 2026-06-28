#include <stdio.h>
#include <omp.h>

static long num_steps = 500000000;

int main ()
{
	double x, pi; 
	double sum = 0.0;
	double step = 1.0 / (double)num_steps;

	double start, end;
	start = omp_get_wtime();
        //#pragma omp parallel for default(none) private(x) shared(pi,step) reduction(+:sum) 
	#pragma omp target teams distribute parallel for map(tofrom:sum) map(to:step,num_steps) reduction(+:sum)  
        for (long i = 0; i < num_steps; i++) 
	{
		x = (i + 0.5) * step;
		sum = sum + 4.0 / (1.0 + x*x);
	}

	end = omp_get_wtime();
	
	pi = step * sum;
	printf("Pi = %.14lf\n", pi); 
	printf("Total Time = %f (sec)\n", end - start);
}
