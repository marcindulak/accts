import os
import sys
import glob
import shutil
import subprocess

def cmd(c):
    x = os.system(c)
    assert x == 0, c

def fail(subject, email=None, filename='/dev/null', mailer='mail'):
    assert mailer in ['mailx', 'mail', 'mutt']
    import os
    if email is not None:
        if filename == '/dev/null':
            assert os.system('mail -s "%s" %s < %s' %
                             (subject, email, filename)) == 0
        else: # attachments
            filenames = filename.split()
            if mailer == 'mailx': # new mailx (12?)
                attach = ''
                for f in filenames:
                    attach += ' -a %s ' % f
                # send with empty body
                assert os.system('echo | mail %s -s "%s" %s' %
                                 (attach, subject, email)) == 0
            elif mailer == 'mail': # old mailx (8?)
                attach = '('
                for f in filenames:
                    ext = os.path.splitext(f)[-1]
                    if ext:
                        flog = os.path.basename(f).replace(ext, '.log')
                    else:
                        flog = f
                    attach += 'uuencode %s %s&&' % (f, flog)
                # remove final &&
                attach = attach[:-2]
                attach += ')'
                assert os.system('%s | mail -s "%s" %s' %
                                 (attach, subject, email)) == 0
            else: # mutt
                attach = ''
                for f in filenames:
                    attach += ' -a %s ' % f
                # send with empty body
                assert os.system('mutt %s -s "%s" -c %s < /dev/null' %
                                 (attach, subject, email)) == 0
    raise SystemExit

if '--dir' in sys.argv:
    i = sys.argv.index('--dir')
    dir = os.path.abspath(sys.argv[i+1])
else:
    dir = 'results'

if '--email' in sys.argv:
    i = sys.argv.index('--email')
    email = sys.argv[i+1]
else:
    email = None

assert os.path.isdir(dir)

# remove the old run directory
if os.path.isdir(dir):
    shutil.rmtree(dir)

os.mkdir(dir)
os.chdir(dir)

acctsdir = os.path.join(dir, 'accts')

# MDTMP - this should be a git checkout of the tests repo
cmd('cp -rp /zhome/c9/d/40082/accts/accts ' + dir)

# python modules available under dir
sys.path.insert(0, acctsdir)

from agts import AGTSQueue
from hpcdtu import HPCDTUCluster as Cluster

queue = AGTSQueue()
queue.collect()
cluster = Cluster()
# Example below is confusing: job.script must NOT be the *.agts.py script,
# but the actual python script to be run!
# testsuite.agts.py does both: see gpaw/test/big/miscellaneous/testsuite.agts.py
#queue.jobs = [job for job in queue.jobs if job.script == 'testsuite.agts.py']

nfailed = queue.run(cluster)

gfiles = os.path.join(dir, 'accts-files')
if not os.path.isdir(gfiles):
    os.mkdir(gfiles)

queue.copy_created_files(gfiles)

# make files readable by go
files = glob.glob(gfiles + '/*')
for f in files:
    os.chmod(f, 0644)

version = 1

# MDTMP: version should be git revision
subject = 'ACCTS version %s:' % str(version)
# Send mail:
sfile = os.path.join(dir, 'status.log')
attach = sfile
if not nfailed:
    subject += ' succeeded'
    fail(subject, email, attach, mailer='mailx')
else:
    subject += ' failed'
    # attach failed tests error files
    ft = [l.split()[0] for l in open(sfile).readlines() if 'FAILED' in l]
    for t in ft:
        ef = glob.glob(os.path.join(dir, t) + '.e*')
        for f in ef:
            attach += ' ' + f
    fail(subject, email, attach, mailer='mailx')

if 0:
    # Analysis:
    import matplotlib
    matplotlib.use('Agg')
    from gpaw.test.big.analysis import analyse
    user = os.environ['USER']
    analyse(queue,
            '../analysis/analyse.pickle',  # file keeping history
            '../analysis',                 # Where to dump figures
            rev=niflheim.revision,
            #mailto='gpaw-developers@listserv.fysik.dtu.dk',
            mailserver='servfys.fysik.dtu.dk',
            attachment='status.log')
