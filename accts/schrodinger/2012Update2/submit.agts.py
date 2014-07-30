import os

def agts(queue):
    if 1:
        queue.add('H2O.py',
                  queueopts=['-l', 'nodes=1:ppn=2'],
                  ncpus=1, walltime=1, deps=[])
