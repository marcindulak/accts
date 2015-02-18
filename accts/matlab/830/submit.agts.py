import os

def agts(queue):
    if 1:
        queue.add('Integrate.py',
                  queueopts=['-l', 'nodes=1:ppn=16'],
                  ncpus=1, walltime=2, deps=[])
    if 1:
        queue.add('dcs.py',
                  queueopts=['-l', 'nodes=1:ppn=1'],
                  ncpus=1, walltime=1, deps=[])
