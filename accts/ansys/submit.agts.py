import os

def agts(queue):
    if 0:
        queue.add('mpitest.py',
                  queueopts=['-l', 'nodes=2:ppn=16'],
                  walltime=1, deps=[])
    if 0:  # this exists with code 8?
        queue.add('OscillatingPlate.py',
                  queueopts=['-l', 'nodes=1:ppn=4'],
                  walltime=1, deps=[])
