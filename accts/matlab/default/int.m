v = ver;
assert (any(strcmp({v.Name},'Parallel Computing Toolbox')), 'Requires Parallel Computing Toolbox');
% Set the number of workers assigned to the batch job (export NSLOTS=`cat $PBS_NODEFILE | wc -l`)
if isempty(getenv('NSLOTS'))
    NumWorkers = 1;   % no NSLOTS variable set - assuming a serial job
else
    NumWorkers = str2num(getenv('NSLOTS'));
end
ver_matlab = ver('matlab');
if ver_matlab.Version <= '8.1'  % R2013a uses matlabpool
if matlabpool('size') == 0 
   tic;
   matlabpool('open', NumWorkers);
   toc;
end
disp(matlabpool('size'));
else
tic;
parpool(NumWorkers);
toc;
% Determine size of the current pool
% http://www.mathworks.se/help/distcomp/parpool.html
poolobj = gcp('nocreate'); % If no pool, do not create new one.
if isempty(poolobj)
    poolsize = 0;
else
    poolsize = poolobj.NumWorkers;
end
disp(poolsize);
end
% calculate indefinite integrals in a loop with parfor - note indeterministic order!
% http://www.mathworks.se/help/symbolic/int.html
% http://www.mathworks.se/help/distcomp/parfor.html
p = 20;
% http://www.mathworks.se/help/symbolic/symvar.html
syms x n
f(n) = x^n;
% measure time http://www.mathworks.se/help/matlab/ref/tic.html
tic;
parfor i = 0:p
    disp(int(f(i), x));
end
toc;
