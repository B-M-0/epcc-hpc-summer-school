#!/bin/bash

# Slurm job options (name, compute nodes, job time)
#SBATCH --job-name=pi
#SBATCH --partition=gpu
#SBATCH --qos=reservation
#SBATCH --reservation=Q3037390_Wed
#SBATCH --gpus=1
#SBATCH --time=00:05:00

# Replace [budget code] below with your budget code (e.g. t01)

module load PrgEnv-amd
module load rocm
module load craype-accel-amd-gfx90a
module load craype-x86-milan

make clean
make

srun -n 1 ./cfd 20 4000
