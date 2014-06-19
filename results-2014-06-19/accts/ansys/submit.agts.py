import os

def agts(queue):
    if 1:
        queue.add('mpitest.py',
                  queueopts=['-l', 'nodes=2:ppn=16'],
                  walltime=2, deps=[])
    if 1:
        queue.add('OscillatingPlate.py',
                  queueopts=['-l', 'nodes=2:ppn=16'],
                  walltime=10, deps=[])
