import os

def agts(queue):
    if 1:
        queue.add('H2O_scratch.py',
                  queueopts=['-l', 'nodes=1:ppn=4'],
                  ncpus=1, walltime=5, deps=[])
    if 1:
        queue.add('H2O_home.py',
                  queueopts=['-l', 'nodes=1:ppn=4'],
                  ncpus=1, walltime=5, deps=[])
