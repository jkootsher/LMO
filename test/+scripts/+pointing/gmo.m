% Analysis of communications pointing calculation
% ASEN 5010 Capstone Part 5

%% Initialization step
GMO = spacecraft.GMO.satellite;
LMO = spacecraft.LMO.satellite;

GMO.run;
LMO.run;

% Setup timing for queries
t = 330;
tools.convert.timing.query(t);

%% LMO communications pointing frame
logger = support.logger("outputs/task05out.txt");
n = tools.convert.timing.a2d(t);

% RN frame (R is communications pointing; GMO)
RN = LMO.N2C(n);

% Display to command window
fprintf(logger.fd,"RN(1) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(1,:));
fprintf(logger.fd,"RN(2) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(2,:));
fprintf(logger.fd,"RN(3) = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", RN(3,:));

%% LMO angular velocity (NR frame conversion)

w = gnc.rates.comm(LMO);

% Write to output
fprintf(logger.fd,"w = \n");
fprintf(logger.fd,"\t %.8f %.8f %.8f\n", w);

%% Close logging
logger.close;