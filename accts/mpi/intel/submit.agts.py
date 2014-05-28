import os

def agts(queue):
    if 1:
        queue.add('examples.py',
                  queueopts=['-l', 'nodes=2:ppn=8'],
                  ncpus=1, walltime=1, deps=[])
