% Analysis of orbital attitude calculation
% ASEN 5010 Capstone Part 1

%% Initialization step and runtime (LMO)
LMO = spacecraft.LMO.satellite;
LMO.run;

% Setup timing for queries
t = 450;
tools.convert.timing.query(t);

%% LMO position and velocity in inertial frame
logger = support.logger("outputs/task01out.txt");
n = tools.convert.timing.a2d(t);

% LMO position
figure('Name','LMO r'); plot(LMO.r.ts.data'); title("LMO: Inertial r");
xlabel("Sample (n)");ylabel("Position (km)");legend("n1","n2","n3");

% LMO velocity
figure('Name','LMO dr'); plot(LMO.dr.ts.data'); title("LMO: Inertial dr");
xlabel("Sample (n)");ylabel("Velocity (km/s)");legend("n1","n2","n3");

% Write to output
fprintf(logger.fd,"LMOr = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", LMO.r.at(n));

fprintf(logger.fd,"LMOdr = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", LMO.dr.at(n));

%% Initialization step and runtime (GMO)
GMO = spacecraft.GMO.satellite;
GMO.run(1200);

% Setup timing for queries
t = 1150;
tools.convert.timing.query(t);

%% GMO position and velocity in inertial frame
n = tools.convert.timing.a2d(t);

% GMO position
figure('Name','GMO r'); plot(GMO.r.ts.data'); title("GMO: Inertial r");
xlabel("Sample (n)");ylabel("Position (km)");legend("n1","n2","n3");

% GMO velocity
figure('Name','GMO dr'); plot(GMO.dr.ts.data'); title("GMO: Inertial dr");
xlabel("Sample (n)");ylabel("Velocity (km/s)");legend("n1","n2","n3");

% Write to output
fprintf(logger.fd,"GMOr = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", GMO.r.at(n));

fprintf(logger.fd,"GMOdr = \n");
fprintf(logger.fd,"\t %.6f %.6f %.6f\n", GMO.dr.at(n));

%% Close logging
logger.close;