// http://help.scilab.org/docs/5.5.0/en_US/parallel_run.html

function a=g(arg1)
disp("called on "+string(arg1));
  a=arg1*arg1;
disp("computed "+string(a));
endfunction

res=parallel_run(1:6, g); // the actual output depends on the architecture (i.e. 4 cores) and current load
exit
