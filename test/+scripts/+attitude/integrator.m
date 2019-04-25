% Analysis of RK4 attitude integrator
% ASEN 5010 Capstone Part 7

%% Initialization step
LMO = spacecraft.LMO.satellite;
LMO.run;

% Setup timing for queries
t = 500;
tools.convert.timing.query(t);

%% LMO angular momentum (body)
logger = support.logger("outputs/task07out.txt");
n = tools.convert.timing.a2d(t);

% Calculate
H = tools.physics.Hmomentum(LMO.w.at(n));

% Write to output
fprintf(logger.fd,"H = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", H);

%% LMO rotational kinetic energy

% Calculate
T = tools.physics.Tenergy(LMO.w.at(n));

% Write to output
fprintf(logger.fd,"T = \n");
fprintf(logger.fd,"\t %.6f\n", T);

%% LMO MRP attitude description

% Write to output
fprintf(logger.fd,"s = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", LMO.s.at(n));

%% LMO angular momentum (inertial)

% Calculate
BN = gnc.frames.BN(LMO.s.at(n));
H = BN'*tools.physics.Hmomentum(LMO.w.at(n));

% Write to output
fprintf(logger.fd,"H = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", H);

%% Issue a reset
support.reset;

%% Set a control torque and reinitialize the models
constant = tools.get.constant.value;
constant.L = [0.01;-0.01;0.02];

LMO = spacecraft.LMO.satellite;
LMO.run;

% Setup timing for queries
t = 100;
tools.convert.timing.query(t);

%% LMO MRP attitude description w/ control torque
n = tools.convert.timing.a2d(t);

% Write to output
fprintf(logger.fd,"s = \n");
fprintf(logger.fd,"\t %.8f %.8f %.8f\n", LMO.s.at(n));

%% Close logging
logger.close;