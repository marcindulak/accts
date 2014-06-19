#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# set path
export PATH=/appl/ansys/bin:${PATH}

cp -rp /appl/ansys/14/v140/CFX/examples/OscillatingPlate.* .
ansys -dis -cnf $PBS_NODEFILE -np `cat $PBS_NODEFILE | wc -l` -b -i OscillatingPlate.inp
