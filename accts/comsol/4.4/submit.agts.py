import os

def agts(queue):
    if 1:
        queue.add('BeamModel.py',
                  queueopts=['-l', 'nodes=1:ppn=16'],
                  walltime=1, deps=[])
