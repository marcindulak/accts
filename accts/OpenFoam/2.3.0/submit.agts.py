import os

def agts(queue):
    a = queue.add('dam_break_long_scratch.py',
                  queueopts=['-l', 'nodes=4:ppn=4',
                             '-W', 'x=nmatchpolicy:exactnode'],
                  ncpus=1, walltime=6, deps=[])
    X2680 = queue.add('dam_break_long.py X2680',
                      queueopts=['-l', 'nodes=2:ppn=8',
                                 '-l', 'feature=XeonE5-2680',
                                 '-W', 'x=nmatchpolicy:exactnode'],
                      ncpus=1, walltime=3, deps=[a])
    X5550 = queue.add('dam_break_long.py X5550',
                      queueopts=['-l', 'nodes=2:ppn=8',
                                 '-l', 'feature=XeonX5550',
                                 '-W', 'x=nmatchpolicy:exactnode'],
                      ncpus=1, walltime=3, deps=[X2680])
    
