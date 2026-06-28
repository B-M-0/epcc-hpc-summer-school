#!/bin/bash

# Slurm job options (name, compute nodes, job time)
#SBATCH --job-name=pi
#SBATCH --partition=gpu
#SBATCH --qos=gpu-shd
#SBATCH --gpus=1
#SBATCH --time=00:05:00

# Replace [budget code] below with your budget code (e.g. t01)
#SBATCH --account=[budget code]


module load rocm
module load craype-accel-amd-gfx90a
module load craype-x86-milan


srun -n 1 ./pi
