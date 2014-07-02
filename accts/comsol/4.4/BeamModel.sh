#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# set path
export PATH=/appl/comsol/4.4/bin:${PATH}

# Note: only single-node parallel jobs are currently supported!

cp -p /appl/comsol/4.4/demo/api/beammodel/BeamModel.mph .
comsol batch -clustersimple -f $PBS_NODEFILE -inputfile BeamModel.mph -outputfile BeamModel.out.mph
