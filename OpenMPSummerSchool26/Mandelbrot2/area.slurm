#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=Mandelbrot
#SBATCH --time=0:02:0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=128

#SBATCH --account=tc073
#SBATCH --partition=standard
#SBATCH --qos=short

# Propagate the cpus-per-task setting from script to srun commands
#    By default, Slurm does not propagate this setting from the sbatch
#    options to srun commands in the job script. If this is not done,
#    process/thread pinning may be incorrect leading to poor performance
export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK

#   We want one thread per physical core
export OMP_NUM_THREADS=1
export OMP_PLACES=cores
export OMP_PROC_BIND=close 

# Launch the parallel job
srun --hint=nomultithread --distribution=block:block ./area
