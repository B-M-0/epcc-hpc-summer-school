program pi_fortran
	use omp_lib
	use iso_fortran_env, only : int64
	implicit none

	integer, parameter :: dp = kind(1.0d0)

	integer (kind = int64) :: i, num_steps
	real (kind = dp) :: x, pi, start, end, sum, step

	num_steps = 500000000_int64
	sum = 0.0
	step = 1.0_dp / num_steps
	
	start = omp_get_wtime()
	
	do i = 0, num_steps - 1
		x = (i + 0.5) * step
		sum = sum + 4.0_dp / (1.0_dp + x**2)
	end do

	end = omp_get_wtime()
	
! calculate and output results
	pi = step * sum
	write (*, *) "Pi = ", pi
	write (*, *) "Total Time =", end - start, "(sec)"

end program pi_fortran
