import os
import shutil

machine = os.environ.get('MACHINE', 'TEST')
shutil.rmtree(machine, ignore_errors=True)

import sys
import subprocess

result = subprocess.Popen('sh prepare.sh', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)
