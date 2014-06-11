#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

octave linspace_test.oct
