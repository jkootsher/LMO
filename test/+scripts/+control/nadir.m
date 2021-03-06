% Analysis of nadir pointing control
% ASEN 5010 Capstone Part 9

%% Initialization step
LMO = spacecraft.LMO.satellite;
LMO.U = @gnc.controls.pdc;
LMO.C = @LMO.N2P;
LMO.run;

%% Issue nadir pointing control query
logger = support.logger("outputs/task09out.txt");

% Setup timing for queries
t = [15;100;200;400];

for i = 1:length(t)
    n = tools.convert.timing.a2d(t(i));
    
    % Query MRPs at sample n
    s = LMO.s.at(n);
    
    fprintf(logger.fd,"s@%i = \n",t(i));
    fprintf(logger.fd,"\t %.6f %.6f %.6f\n",s);
end

%% Close logging
logger.close;