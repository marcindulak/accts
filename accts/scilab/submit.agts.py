import os

def agts(queue):
    if 1:
        queue.add('parallel_run.py',
                  queueopts=['-l', 'nodes=1:ppn=1'],
                  ncpus=1, walltime=2, deps=[])
