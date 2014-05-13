import os

def agts(queue):
    if 1:
        queue.add('test_spinpol.py',
                  queueopts=['-l', 'nodes=1:ppn=1'],
                  ncpus=1, walltime=5, deps=[])
