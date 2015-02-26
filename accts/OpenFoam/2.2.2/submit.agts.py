import os

def agts(queue):
    if 1:
        queue.add('dam_break_long.py',
                  queueopts=['-l', 'nodes=4:ppn=4'],
                  ncpus=1, walltime=4, deps=[])
