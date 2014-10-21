import sys
import subprocess

result = subprocess.Popen('sh dam_break_long_scratch.job', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)
