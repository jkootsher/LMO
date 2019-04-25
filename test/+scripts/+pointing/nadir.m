% Analysis of sun pointing calculation
% ASEN 5010 Capstone Part 4

%% Initialization step
LMO = spacecraft.LMO.satellite;
LMO.run;

% Setup timing for queries
t = 330;
tools.convert.timing.query(t);

%% LMO nadir pointing frame
logger = support.logger("outputs/task04out.txt");
n = tools.convert.timing.a2d(t);

% RN frame (R is nadir pointing)
RN = LMO.N2P(n);

% Display to command window
fprintf(logger.fd,"RN(1) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(1,:));
fprintf(logger.fd,"RN(2) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(2,:));
fprintf(logger.fd,"RN(3) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(3,:));

%% LMO angular velocity (NR frame conversion)

w = gnc.rates.nadir(LMO);

% Write to output
fprintf(logger.fd,"w = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", w);

%% Close logging
logger.close;