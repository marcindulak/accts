#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# http://r.research.att.com/benchmarks/
wget http://r.research.att.com/benchmarks/R-benchmark-25.R

# Warning: currently R on HPC does not use multithreaded blas!
# so two jobs below run equally fast

# 1. multithreaded
export OMP_NUM_THREADS=`cat $PBS_NODEFILE | wc -l`
time /appl/R/bin/R CMD BATCH R-benchmark-25.R R-benchmark-25.R.${OMP_NUM_THREADS}
# 2. single-threaded
export OMP_NUM_THREADS=1
time /appl/R/bin/R CMD BATCH R-benchmark-25.R R-benchmark-25.R.${OMP_NUM_THREADS}
# clean
rm -f .RData
