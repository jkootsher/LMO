% Analysis of full simulation
% ASEN 5010 Capstone Part 11

%% Initialization step
simulator = exe.simulator;
simulator = simulator.run;

%% Issue MRP query
logger = support.logger("outputs/task11out.txt");

% Setup timing for queries
t = [300;2100;3400;4400;5600];

for i = 1:length(t)
    n = tools.convert.timing.a2d(t(i));
    
    % Query MRPs at sample n
    s = simulator.LMO.s.at(n);
    
    fprintf(logger.fd,"s@%i = \n",t(i));
    fprintf(logger.fd,"\t %.6f %.6f %.6f\n",s);
end

% Plot MRP and angular velocity
xplot(simulator.LMO.s.ts.data');
xplot(simulator.LMO.w.ts.data');

%% Close logging and cleanup
logger.close;
support.reset;
evalin('base','clear all');