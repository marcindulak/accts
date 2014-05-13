#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# load the required modules
module load asegpaw/3.6.0-0.9.0.8965

gpaw-python spinpol.py --debug
