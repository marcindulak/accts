#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

export PATH=/appl/mathematica/bin:${PATH}

# http://superuser.com/questions/315337/how-to-make-commands-in-mathematica-8-use-all-cores
# http://reference.wolfram.com/mathematica/guide/ParallelComputing.html

# 1. parallel
# mathematica does not integrate with Moab
# so we LaunchKernels[n] where n is the number of cores assigned by Moab
# http://sc.tamu.edu/help/faq/Mathematica.php
( echo "LaunchKernels["`cat $PBS_NODEFILE | wc -l`"]"; cat ParallelTable.m ) | time math
# 2. serial
time math < Do.m
