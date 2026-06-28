#!/bin/bash

# Slurm job options (name, compute nodes, job time)
#SBATCH --job-name=sharpen
#SBATCH --time=0:5:0
#SBATCH --nodes=1
# You should normally set this to your own budget, e.g. m25oc-s1234567

# Source - https://stackoverflow.com/a/49111
# Posted by Rob Rolnick, modified by community. See post 'Timeline' for change history
# Retrieved 2026-06-18, License - CC BY-SA 4.0



SBATCH --cpus-per-task=1

# Source - https://stackoverflow.com/a/49114
# Posted by Nick Stinemates, modified by community. See post 'Timeline' for change history
# Retrieved 2026-06-18, License - CC BY-SA 3.0


SBATCH --partition=standard
#SBATCH --qos=short

# Set the number of threads to 1
#   This prevents any threaded system libraries from automatically
#   using threading.
export OMP_NUM_THREADS=1

export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK

# Launch the serial job
#   Using 1 thread


# Source - https://stackoverflow.com/a/49114
# Posted by Nick Stinemates, modified by community. See post 'Timeline' for change history
# Retrieved 2026-06-18, License - CC BY-SA 3.0

#for ((i = 1 ; i < 128 ; i++ )); do | SBATCH --cpus-per-run = i |; done

srun --ntasks=1 --unbuffered --distribution=block:block --hint=nomultithread ./cfd 8 20000
