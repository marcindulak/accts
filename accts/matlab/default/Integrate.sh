#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# matlab does not(?) integrate with Moab (June 2014)
# so we launch a pool of n NumWorkers where n is the number of cores assigned by Moab
# http://www.mathworks.se/help/distcomp/parpool.html
NSLOTS=`cat $PBS_NODEFILE | wc -l`  # environment variables used by matlab script
time matlab -nodisplay -r int
