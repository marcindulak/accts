% http://ch.mathworks.com/matlabcentral/answers/133781-matlab-distributed-computing-server
% http://se.mathworks.com/help/distcomp/parallel.importprofile.html
parallel.importProfile('hpcsite')

cluster = parcluster('hpcsite')

if isempty(getenv('NSLOTS'))
    NumWorkers = 1;   % no NSLOTS variable set - assuming a serial job
else
    NumWorkers = str2num(getenv('NSLOTS'));
end
cluster.NumWorkers = NumWorkers

% How to move it to the end of submit_args?
%if ~isempty(getenv('PBS_JOBNAME'))
%    cluster.SubmitArguments = [cluster.SubmitArguments ' -N ' getenv('PBS_JOBNAME')];
%end

if ~isempty(getenv('NODES'))
    cluster.SubmitArguments = [cluster.SubmitArguments ' -l ' getenv('NODES')];
    cluster.ResourceTemplate = [cluster.ResourceTemplate ' -l ' getenv('NODES')];
end

if ~isempty(getenv('WALLTIME'))
    cluster.ResourceTemplate = [cluster.ResourceTemplate ' -l walltime=' getenv('WALLTIME')];
end

parpool(cluster)

spmd

  if ( labindex == 1 )
    fprintf ( 1, ' Running with %d labs.\n', numlabs );
  end

  % http://www.mathworks.com/matlabcentral/newsreader/view_thread/336479
  [status, myHostName] = system('hostname')
  
  % http://ch.mathworks.com/matlabcentral/fileexchange/16450-get-computer-name-hostname/content/getComputerName.m
  if status ~= 0,
     if ispc
        myHostName = getenv('COMPUTERNAME');
     else      
        myHostName = getenv('HOSTNAME');      
     end
  end
  
  % Error ...
  % An UndefinedFunction error was thrown on the workers for 'myHostname'

  % get all worker hostnames as a cell array
  allHostNames = gcat({myHostName});
  
  % find first occurrence of my hostname
  leadWorkerIndex = find(strcmp(myHostName, allHostNames), 1, 'first');
  
  if labindex == leadWorkerIndex
    fprintf ( 1, 'On hostname %s the leadWorker is %d.\n', myHostName, labindex );
  end

  for i = 1: numlabs
    if labindex == i
      fprintf ( 1, 'Rank %d out of %d on %s.\n', labindex, numlabs, myHostname );
    end
  end
end

poolobj = gcp('nocreate');
delete(poolobj)
