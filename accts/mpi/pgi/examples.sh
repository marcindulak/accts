#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# load the required modules
module load pgi mpi/pgi

# get the examples for the given openmpi version
svn co http://svn.open-mpi.org/svn/ompi/tags/v1.6-series/v1.6.5/examples
cd examples
make
if test $? -gt 0;
then
exit 1  # catch compilation failures
fi
# test all executables
exe='
mpicc
mpic++
mpif90
mpif77'
for f in $exe; do which $f; done
for f in `find . -maxdepth 1 -executable -type f | LC_ALL=C sort`; do echo Running $f; ldd $f; mpiexec $f; done
# clean
make clean

