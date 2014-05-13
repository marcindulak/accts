#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# The CUDA device reserved for you by the batch system
CUDADEV=`cat $PBS_GPUFILE | rev | cut -d"-" -f1 | rev | tr -cd [:digit:]`

# load the required modules
module load cuda/5.5

cp -rp /opt/cuda/5.5/samples/1_Utilities/bandwidthTest .
cd bandwidthTest
sed -i -e 's|INCLUDES.*=.*|INCLUDES=-I$(CUDA_PATH)/samples/common/inc|' Makefile
sed -i -e 's|../../bin/|./bin/|' Makefile
make
./bandwidthTest --device=${CUDADEV}
