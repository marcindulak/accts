import os

def agts(queue):
    if 1:
        queue.add('deviceQuery.py',
                  queueopts=['-l', 'nodes=1:ppn=1:gpus=1'],
                  ncpus=1, walltime=5, deps=[])
