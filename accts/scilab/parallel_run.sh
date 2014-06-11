#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

export PATH=/appl/scilab/bin:${PATH}

scilab -nwni -f parallel_run.sci

# distributed computing with mpi available from more recent scilab versions ...
# http://wiki.scilab.org/Documentation/ParallelComputingInScilab
