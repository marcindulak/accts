import sys
import subprocess

result = subprocess.Popen('sh dam_break_long.job', shell=True)
text = result.communicate()[0]
sys.exit(result.returncode)
