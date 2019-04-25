function r = comm(GMO,LMO)
% Calculate GMOr-LMOr state vector one second into the future
constants = tools.get.constant.value;

% Query and model times
N = constants.N;
n = LMO.n;

% Verify if a query of the data (N>1) or an integration (N=1)
if ~isequal(N,1)
    n = N;
end

% Euler 1st order integrator
integrate = @tools.math.eulersum;

% Calculate the n+1 inertial samples
for m = 1:tools.convert.timing.a2d(1)
    GMOO(:,m) = integrate(GMO.do.ic.data,GMO.o.ic.data,n+m);
    LMOO(:,m) = integrate(LMO.do.ic.data,LMO.o.ic.data,n+m);
end

% Obtain GMO and calculate LMO at n+1
GMOr = GMO.r.at(n+m);

% When the sim is enabled, the GMO inertial information
% is not prepopulated as it is when running test scripts.
% This statement ensures there is useable data when both
% models run concurrently.
if isequal(constants.sim_enable,1)
    NH = gnc.frames.HN(GMOO(:,m))';
    GMOr = NH*GMO.r.ic.data;
end

NH = gnc.frames.HN(LMOO(:,m))';
LMOr = NH*LMO.r.ic.data;

% Delta r calculation for time n+1
r = GMOr - LMOr;
end

