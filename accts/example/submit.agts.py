import os

def agts(queue):
    # Setting any variable in this script is ignored!
    machine = os.environ.get('MACHINE', 'TEST')
    ncores = int(os.environ.get('NCORES', 8))
    #
    if 1:
         prepare = queue.add('prepare.py',
                             queueopts=['-l', 'nodes=1:ppn=1'],
                             ncpus=1, walltime=5, deps=[])
