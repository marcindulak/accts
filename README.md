accts
=====

accts (Advanced CC (Coputing Center) Test System) is used to test software installed on an HPC system by running
and reporting results of the corresponding batch jobs.
It is based on agts (Advanced GPAW Test System: https://wiki.fysik.dtu.dk/gpaw/devel/testing.html).

usage
=====

The test suite is started periodically by configuring cron with the crontab file::

    cat crontab | crontab

This calls in turn the accts.el6.sh script, and this the accts.el6.py script.
Review and modify these 3 scripts.

The main python module is under accts/agts.py (the original
GPAW one: there should be no need to modify this)
and the particular batch system configuration is in accts/hpcdtu.py (review and modify it).

In short, the test system when started by cron will search for \*.agts.py
and submit jobs accordingly to definitions found in those \*.agts.py files.
The result are reported under results*, and an email is send, e.g.::

    # job                                                                  status      time   tmax ncpus  deps files id
    accts/Gaussian/09_D01/H2O_scratch.py                                   success        7    360     1     0     0 225129
    accts/Gaussian/09_D01/H2O_home.py                                      success        8    360     1     0     0 225130
    accts/maple/Integrate.py                                               success        4    180     1     0     0 225131
    accts/scilab/parallel_run.py                                           success        5    180     1     0     0 225132


