import os

def agts(queue):
    if 0:
        queue.add('dhfr.py',
                  queueopts=['-l', 'nodes=1:ppn=4'],
                  ncpus=1, walltime=5, deps=[])
