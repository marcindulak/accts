#!/bin/sh

# scipy.weave!                                                             
python_compiled=`readlink -f ~/.python26_compiled`
# where python modules are
python_path=`readlink -f ~/accts/accts`

# This assumes the root directory of ~/accts - the results of the tests will be ~/accts.results/results*
date=`/bin/date +"%Y-%m-%d"`&& /bin/rm -f ~/.matplotlib/fontList.cache && /bin/rm -rf ${python_compiled} && /bin/rm -f ~/accts.results/results.out-${date} && /bin/rm -rf ~/accts.results/results-${date} && mkdir -p ~/accts.results/results-${date} && export PYTHONDONTWRITEBYTECODE=1 && export PYTHONPATH=${python_path}:${PYTHONPATH} && python -tt -Wd ~/accts/accts.el6.py --dir ~/accts.results/results-${date} --email ${email} > ~/accts.results/results.out-${date}
