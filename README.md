accts
=====

accts (Advanced CC (Computing Center) Test System) is used to test software
installed on an HPC system by running and reporting results of the batch jobs.
It is based on agts (Advanced GPAW Test System:
https://wiki.fysik.dtu.dk/gpaw/devel/testing.html).
Tested on RHEL6 + Torque/Maui/Moab.

usage
=====

The test suite is started periodically by cron.
Configure cron with the crontab file::

    cat crontab | crontab

This calls in turn the accts.el6.sh script, and this the accts.el6.py script.
Review and modify these 3 scripts.

The main python module is under accts/agts.py (it is the original
GPAW one: there should be no need to modify this) and the particular batch
system configuration is in accts/hpcsite.py (review and modify this file).

The test system when started by cron will search for \*.agts.py
files and submit jobs accordingly to definitions found in those.
The result are reported under ~/accts.results/*, and an email is sent, e.g.::

    # job                                                                  status      time   tmax ncpus  deps files id
    accts/scilab/parallel_run.py                                           success        6    180     1     0     0 187248
    accts/namd2/2.9/alanin.py                                              FAILED         9    360     1     0     0 187250
    accts/mathematica/Integrate.py                                         success        6    180     1     0     0 187258
    accts/OpenFoam/2.2.2/dam_break_long.py                                 TIMEOUT             960    16     0     0 187259

