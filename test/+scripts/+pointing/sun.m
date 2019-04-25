% Analysis of sun pointing calculation
% ASEN 5010 Capstone Part 3

%% Initialization step
LMO = spacecraft.LMO.satellite;
LMO.run;

% Setup timing for queries
t = 0;
tools.convert.timing.query(t);

%% LMO sun pointing frame
logger = support.logger("outputs/task03out.txt");
n = tools.convert.timing.a2d(t);

% RN frame (R is sun pointing)
RN = LMO.N2S(n);

% Display to command window
fprintf(logger.fd,"RN(1) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(1,:));
fprintf(logger.fd,"RN(2) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(2,:));
fprintf(logger.fd,"RN(3) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(3,:));

%% LMO angular velocity (NR frame conversion)

w = gnc.rates.sun(LMO);

% Write to output
fprintf(logger.fd,"w = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", w);

%% Close logging
logger.close;