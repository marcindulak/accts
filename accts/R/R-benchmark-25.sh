#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# http://r.research.att.com/benchmarks/
wget http://r.research.att.com/benchmarks/R-benchmark-25.R

# 1. multithreaded (openblas)
export OMP_NUM_THREADS=`cat $PBS_NODEFILE | wc -l`
export GOTO_NUM_THREADS=`cat $PBS_NODEFILE | wc -l`
export OPENBLAS_NUM_THREADS=`cat $PBS_NODEFILE | wc -l`
time R CMD BATCH R-benchmark-25.R R-benchmark-25.R.${OMP_NUM_THREADS}
# 2. single-threaded (openblas)
export OMP_NUM_THREADS=1
export GOTO_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
time R CMD BATCH R-benchmark-25.R R-benchmark-25.R.${OMP_NUM_THREADS}
# clean
rm -f .RData
