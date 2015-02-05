#!/bin/bash -l

# The name of the script is lemans_poly_17m
#SBATCH -J lemans_poly_17m

# Recive email notifications with any state change
#SBATCH --mail-type=ALL

# 15 hours wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH -N 3

# Number of MPI processes per node (the following is actually the default)
#SBATCH --ntasks-per-node=32
# Number of MPI processes.
#SBATCH -n 96

# Output and error files
#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J


module unload PrgEnv-cray 
module unload PrgEnv-gnu
module unload PrgEnv-intel
module load PrgEnv-gnu

# starccm+ v9.06.009 single precision
module load starccm+/9.06.009-sp

sim_file="lemans_poly_17m.amg.sim"

STARTMACRO="./benchmark.java"
LETTER=`echo $USER | cut -c1`
LUSTRE_ROOT=/cfs/klemming/nobackup/$LETTER/$USER/StarCCM_config

# Set the temporary path
export TMPDIR=/cfs/klemming/nobackup/$LETTER/$USER

STARTMACRO=${STARTMACRO:+"-batch $STARTMACRO"}

# Using the POD Key                      
starccm+ -power -podkey f6cP59+o6MaXfV90pgBBcs9//hQ  -licpath 1999@flex.cd-adapco.com -collab -np 96 -pio  $STARTMACRO -batch -arch linux-x86_64-2.5 -mpidriver crayxt -nbuserdir $LUSTRE_ROOT ${sim_file}> starccmRun.$SLURM_JOBID.log 2>&1

# Check out the license from a license server
#export CDLMD_LICENSE_FILE=31411@license-1.pdc.kth.se
#starccm+ -power -collab -np 96 -pio  $STARTMACRO -batch -arch linux-x86_64-2.5 -mpidriver crayxt -nbuserdir $LUSTRE_ROOT ${sim_file}> starccmRun.$SLURM_JOBID.log 2>&1

