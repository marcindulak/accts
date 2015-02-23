#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

if test 0`cat $PBS_NODEFILE | wc -l` -gt 1;
then
    echo "DCS parallel Matlab job must be submitted to single core!"
    exit 1
fi
# Below are the PBS settings the parallel Matlab job will use!
export NODES='nodes=2:ppn=2'
export WALLTIME='00:02:00'
# calculate the number of cores (Matlab workers)
# NSLOTS is an environment variable used by matlab script
export NSLOTS=`python -c "print reduce(lambda x, y: x*y, [int(n.split('=')[-1]) for n in '${NODES}'.strip().split(':')])"`
time matlab -nodisplay -r dcs
