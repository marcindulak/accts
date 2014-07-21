import sys
import subprocess

result = subprocess.Popen('sh submit_scratch.sh', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)

