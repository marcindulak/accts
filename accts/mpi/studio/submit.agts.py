import os

def agts(queue):
    if 1:
        queue.add('examples.py',
                  queueopts=['-l', 'nodes=2:ppn=4',
                             '-W', 'x=nmatchpolicy:exactnode'],
                  walltime=2, deps=[])
