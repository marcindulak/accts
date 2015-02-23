import sys
import subprocess

result = subprocess.Popen('sh dcs.sh', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)

