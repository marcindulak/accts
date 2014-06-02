import sys
import subprocess

result = subprocess.Popen('sh R-benchmark-25.sh', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)

