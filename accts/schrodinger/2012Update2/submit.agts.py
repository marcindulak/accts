import os

def agts(queue):
    if 0:  # FATAL -2: Could not check out a license for mmlibs version 2.1.
        queue.add('H2O.py',
                  queueopts=['-l', 'nodes=1:ppn=4'],
                  ncpus=1, walltime=5, deps=[])
