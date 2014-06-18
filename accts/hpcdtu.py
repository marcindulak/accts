import os
import subprocess

from agts import Cluster

def wrap_pylab(names=[]):
    """Use Agg backend and prevent windows from popping up."""
    import matplotlib
    matplotlib.use('Agg')
    import pylab

    def show(names=names):
        if names:
            name = names.pop(0)
        else:
            name = 'fig.png'
        pylab.savefig(name)

    pylab.show = show
	

class HPCDTUCluster(Cluster):
    def __init__(self):
        pass
        
    def write_pylab_wrapper(self, job):
        """Use Agg backend and prevent windows from popping up."""
        fd = open(job.script + '.py', 'w')
        fd.write('from hpcdtu import wrap_pylab\n')
        fd.write('wrap_pylab(%s)\n' % job.show)
        fd.write('execfile(%r)\n' % job.script)
        fd.close()

    def submit(self, job):
        dir = os.getcwd()
        os.chdir(job.dir)

        self.write_pylab_wrapper(job)

        if job.queueopts is None:
            if job.ncpus < 4:
                ppn = '%d:opteron4' % job.ncpus
                nodes = 1
            elif job.ncpus % 16 == 0:
                ppn = '16:xeon16'
                nodes = job.ncpus // 16
            elif job.ncpus % 8 == 0:
                ppn = '8:xeon8'
                nodes = job.ncpus // 8
            else:
                assert job.ncpus % 4 == 0
                ppn = '4:opteron4'
                nodes = job.ncpus // 4
            queueopts = '-l nodes=%d:ppn=%s' % (nodes, ppn)
        else:
            queueopts = job.queueopts

        qsub = (['/apps/dcc/bin/qsub', '-V'] + queueopts
               + ['-l',
               'walltime=%02d:%02d:00' %
               (job.walltime // 3600, job.walltime % 3600 // 60),
               '-N',
               job.name])

        p = subprocess.Popen(qsub,
            stdin=subprocess.PIPE, stdout=subprocess.PIPE)

        out, err = p.communicate(
            'cd ${PBS_O_WORKDIR}\n' +
            'touch %s.start\n' % job.name +
            'export PYTHONPATH=' + dir +'/accts:${PYTHONPATH}&& ' + 
            ' %s %s.py %s > %s.output\n' %
            ('python', job.script, job.args, job.name) +
            'echo $? > %s.done\n' % job.name)
        assert p.returncode == 0
        id = out.split('.')[0]
        job.pbsid = id
        os.chdir(dir)
