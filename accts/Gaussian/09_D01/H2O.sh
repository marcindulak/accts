#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# http://www.hpc.dtu.dk/?page_id=511
export GAUSS_SCRDIR=/SCRATCH/$USER
export g09root=/appl/hgauss/Gaussian_09_D01
. $g09root/g09/bsd/g09.profile

# water example from http://www.gaussian.com/g_tech/g_ur/m_input.htm
( echo %NProcShared=`cat $PBS_NODEFILE | wc -l`; cat H2O.inp ) | g09 > H2O.out
