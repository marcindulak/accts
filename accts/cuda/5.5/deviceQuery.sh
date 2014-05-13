#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# load the required modules
module load cuda/5.5

cd deviceQuery
sed -i -e 's|INCLUDES.*=.*|INCLUDES=-I$(CUDA_PATH)/samples/common/inc|' Makefile
sed -i -e 's|../../bin/|./bin/|' Makefile
make
./deviceQuery
