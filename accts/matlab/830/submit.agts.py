import os

def agts(queue):
    if 1:
        queue.add('Integrate.py',
                  queueopts=['-l', 'nodes=1:ppn=4'],
                  ncpus=1, walltime=2, deps=[])
