#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# 1. parallel
# mathematica does not integrate with Moab (June 2014)
# http://reference.wolfram.com/mathematica/ClusterIntegration/guide/ClusterIntegration.html
# so we LaunchKernels[n] where n is the number of cores assigned by Moab
# http://superuser.com/questions/315337/how-to-make-commands-in-mathematica-8-use-all-cores
( echo "LaunchKernels["`cat $PBS_NODEFILE | wc -l`"]"; cat ParallelTable.m ) | time math
# 2. serial
time math < Do.m
