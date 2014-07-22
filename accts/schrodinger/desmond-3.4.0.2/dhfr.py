import sys
import subprocess

result = subprocess.Popen('sh dhfr.sh', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)

