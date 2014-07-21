import sys
import subprocess

result = subprocess.Popen('sh H2O.sh', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)

