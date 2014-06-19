#email=dulak@fysik.dtu.dk,sebo@dtu.dk
email=dulak@fysik.dtu.dk
#email=dulak@fysik.dtu.dk,marcin.dulak@gmail.com

# scipy.weave!                                                             
python_compiled=`readlink -f ~/.python26_compiled`

#date=`/bin/date +"%Y-%m-%d"`

# Monday morning
#15 05 * * 6 rm -rf ${python_compiled} && touch ~/accts/results.out && mkdir -p ~/accts/results && /bin/rm -f ~/accts/results.out.previous && /bin/mv -f ~/accts/results.out ~/accts/results.out.previous && /bin/rm -rf ~/accts/results.previous && /bin/mv -f ~/accts/results ~/accts/results.previous && mkdir -p ~/accts/results && /bin/rm -f ~/.matplotlib/fontList.cache ; export PYTHONPATH=/zhome/c9/d/40082/accts:${PYTHONPATH} && export PYTHONDONTWRITEBYTECODE=1 && python -tt -Wd ~/accts/accts.el6.py --dir ~/accts/results --email ${email} > ~/accts/results.out
#/bin/rm -rf ${python_compiled} && touch ~/accts/results.out && mkdir -p ~/accts/results && /bin/rm -f ~/accts/results.out-${date} && /bin/mv -f ~/accts/results.out ~/accts/results.out-${date} && /bin/rm -rf ~/accts/results-${date} && /bin/mv -f ~/accts/results ~/accts/results-${date} && mkdir -p ~/accts/results && /bin/rm -f ~/.matplotlib/fontList.cache && export PYTHONDONTWRITEBYTECODE=1 && export PYTHONPATH=`readlink -f ~/accts`:${PYTHONPATH} && cd ~/accts/accts && python -tt -Wd ~/accts/accts.el6.py --dir ~/accts/results --email ${email} > ~/accts/results.out
02 13 * * * date=`/bin/date +"\%Y-\%m-\%d"`&& /bin/rm -f ~/.matplotlib/fontList.cache && /bin/rm -rf ${python_compiled} && /bin/rm -f ~/accts/results.out-${date} && /bin/rm -rf ~/accts/results-${date} && mkdir -p ~/accts/results-${date} && export PYTHONDONTWRITEBYTECODE=1 && export PYTHONPATH=`readlink -f ~/accts`:${PYTHONPATH} && python -tt -Wd ~/accts/accts.el6.py --dir ~/accts/results-${date} --email ${email} > ~/accts/results.out-${date}
