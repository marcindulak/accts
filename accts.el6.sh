#email=dulak@fysik.dtu.dk,sebo@dtu.dk
email=dulak@fysik.dtu.dk
#email=dulak@fysik.dtu.dk,marcin.dulak@gmail.com

# scipy.weave!                                                             
python_compiled=`readlink -f ~/.python26_compiled`

#date=`/bin/date +"%Y-%m-%d"`

#/bin/rm -f ~/.matplotlib/fontList.cache && /bin/rm -rf ${python_compiled} && /bin/rm -f ~/accts/results.out-${date} && /bin/rm -rf ~/accts/results-${date} && mkdir -p ~/accts/results-${date} && export PYTHONDONTWRITEBYTECODE=1 && export PYTHONPATH=`readlink -f ~/accts/accts`:${PYTHONPATH} && python -tt -Wd ~/accts/accts.el6.py --dir ~/accts/results-${date} --email ${email} > ~/accts/results.out-${date}
# Monday morning
00 01 * * * date=`/bin/date +"\%Y-\%m-\%d"`&& /bin/rm -f ~/.matplotlib/fontList.cache && /bin/rm -rf ${python_compiled} && /bin/rm -f ~/accts/results.out-${date} && /bin/rm -rf ~/accts/results-${date} && mkdir -p ~/accts/results-${date} && export PYTHONDONTWRITEBYTECODE=1 && export PYTHONPATH=`readlink -f ~/accts/accts`:${PYTHONPATH} && python -tt -Wd ~/accts/accts.el6.py --dir ~/accts/results-${date} --email ${email} > ~/accts/results.out-${date}
