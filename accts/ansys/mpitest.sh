#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# set path
export PATH=/appl/ansys/bin:${PATH}

# Warning: ansys is not free! Read the license restrictions before use!
# http://www.mbar.dtu.dk/ANSYS/ansys.html

ansys -dis -np `cat $PBS_NODEFILE | wc -l` -cnf $PBS_NODEFILE -mpitest

