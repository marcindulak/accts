import sys
import subprocess

result = subprocess.Popen('sh submit_home.sh', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)

