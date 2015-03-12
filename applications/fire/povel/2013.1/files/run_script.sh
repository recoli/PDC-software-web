#!/bin/bash

module add fire/2013.1

# 24 processes on Povel and 8 processes per node on Ferlin
processes_per_node=24

total_processes=`expr $processes_per_node \* $SP_PROCS`

# Adapt the name of nodes for AVL Fire
export hosts=`hostconvert_fire_povel.pl $SP_HOSTFILE`
export MPI_REMSH=/pdc/vol/fire/2013.1/PDC_bin/ssh

fire_cmd -name=fire -no_file_locking -nomapping -mpi -cpu=$total_processes -hostlist=$hosts -project_dir=$PWD -case=Case -solver_vers=v2013.1
