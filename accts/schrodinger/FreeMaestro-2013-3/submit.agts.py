import os

def agts(queue):
    if 1:
        queue.add('para_testapp.py',
                  queueopts=['-l', 'nodes=1:ppn=1'],
                  ncpus=1, walltime=1, deps=[])
