import os

def agts(queue):
    if 1:
        queue.add('dam_break_long.py',
                  queueopts=['-l', 'nodes=1:ppn=16'],
                  ncpus=16, walltime=15, deps=[])
