#!/bin/sh

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

# load the required modules
module load asegpaw/3.6.0-0.9.0.8965

python -c "from ase.calculators.emt import EMT; from ase.structure import molecule; print molecule('H2', calculator= EMT()).get_potential_energy()"
