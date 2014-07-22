#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# load the required modules
module load oldmpi/gcc
export PATH=/appl/desmond/3.4.0.2/bin:$PATH
export LD_LIBRARY_PATH=/appl/desmond/3.4.0.2/lib:$LD_LIBRARY_PATH
export DESMOND_PLUGIN_PATH=/appl/desmond/3.4.0.2/lib/plugin:$LD_LIBRARY_PATH

cp -rp /appl/desmond/3.4.0.2/share/samples/* .
# http://wiki.hpc.ufl.edu/doc/Desmond_PBS
mpirun desmond --destrier mpi --tpp 1 --include dhfr.cfg --cfg boot.file=dhfr.dms --cfg mdsim.plugin.eneseq.name=dhfr.eneseq.mpi

