% Analysis of attitude error tracking
% ASEN 5010 Capstone Part 6

%% Initialization step
GMO = spacecraft.GMO.satellite;
LMO = spacecraft.LMO.satellite;

GMO.run;
LMO.run;

% Setup timing for queries
t = 0;
tools.convert.timing.query(t);
n = tools.convert.timing.a2d(t);

%% LMO sun pointing frame error tracking
logger = support.logger("outputs/task06out.txt");

% Attitude and angular velocity estimates
[~,sbar,wbar] = LMO.N2S(n);

% Write to output
fprintf(logger.fd,"\nSun Pointing Frame: \n");
fprintf(logger.fd,"sbar = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", sbar);
fprintf(logger.fd,"wbar = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", wbar);

%% LMO nadir pointing frame error tracking

% Attitude and angular velocity estimates
[~,sbar,wbar] = LMO.N2P(n);

% Write to output
fprintf(logger.fd,"\nNadir Pointing Frame: \n");
fprintf(logger.fd,"sbar = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", sbar);
fprintf(logger.fd,"wbar = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", wbar);

%% LMO communiications pointing frame error tracking

% Attitude and angular velocity estimates
[~,sbar,wbar] = LMO.N2C(n);

% Write to output
fprintf(logger.fd,"\nCommunications Pointing Frame: \n");
fprintf(logger.fd,"sbar = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", sbar);
fprintf(logger.fd,"wbar = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", wbar);

%% Close logging
logger.close;