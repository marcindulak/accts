import os

def agts(queue):
    if 1:
        queue.add('R-benchmark-25.py',
                  queueopts=['-l', 'nodes=1:ppn=8'],
                  ncpus=1, walltime=7, deps=[])
