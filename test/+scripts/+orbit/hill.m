% Analysis of orbital frame calculation
% ASEN 5010 Capstone Part 2

%% Initialization step
LMO = spacecraft.LMO.satellite;
LMO.run;

% Setup timing for queries
t = 300;
tools.convert.timing.query(t);

%% LMO orbital frame orientation
logger = support.logger("outputs/task02out.txt");
n = tools.convert.timing.a2d(t);

% HN frame
HN = LMO.N2H(n);

% Display to command window
fprintf(logger.fd,"HN(1) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", HN(1,:));
fprintf(logger.fd,"HN(2) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", HN(2,:));
fprintf(logger.fd,"HN(3) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", HN(3,:));

%% Close logging
logger.close;