#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# load the required modules
module load schrodinger/2012Update2

cp -rp /opt/schrodinger/2012Update2/jaguar-v79515/samples/H2O.in .
# run jaguar in parallel http://www.schrodinger.com/kb/1793
jaguar run -NPROC `cat $PBS_NODEFILE | wc -l` -HOST `hostname` H2O.in

