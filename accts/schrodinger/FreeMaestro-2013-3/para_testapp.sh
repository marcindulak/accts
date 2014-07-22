#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# load the required modules
export PATH=/appl/schroedingerFreeMaestro/2013-3:${PATH}

para_testapp
