#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

export PATH=/appl/matlab/830/bin:${PATH}

# single-node job: we launch a pool of n NumWorkers where n is the
# number of cores assigned by Moab
# http://www.mathworks.se/help/distcomp/parpool.html
# NSLOTS is an environment variable used by matlab script
NSLOTS=`cat $PBS_NODEFILE | wc -l`
time matlab -nodisplay -r int
