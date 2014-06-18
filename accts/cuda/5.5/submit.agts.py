import os

def agts(queue):
    if 0:  # user needs to be in visual queue - otherwise waiting too long!
        queue.add('deviceQuery.py',
                  queueopts=['-l', 'nodes=1:ppn=1:gpus=1'],
                  ncpus=1, walltime=5, deps=[])
        queue.add('bandwidthTest.py',
                  queueopts=['-l', 'nodes=1:ppn=1:gpus=1'],
                  ncpus=1, walltime=5, deps=[])
