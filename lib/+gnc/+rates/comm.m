function w = comm(satellite)
% Communications pointing frame rates calculation
% Rotate frames to find appropriate rates
N = tools.get.constant.value.N;
GMO  = spacecraft.GMO.satellite;

% Delta r calculation for time n+1 and n
rh = gnc.state.comm(GMO,satellite);

% Adjust for orbit frame IC (if needed)
if isequal(N,0)
    NH = gnc.frames.HN(GMO.o.at(0))';
    GMOr = NH*GMO.r.at(0);
    
    NH = gnc.frames.HN(satellite.o.at(0))';
    LMOr = NH*satellite.r.at(0);
else % Already in inertial frame
    GMOr = GMO.r.at(N);
    LMOr = satellite.r.at(N);
end

rl = GMOr - LMOr;

% Necessary frames
RNh = gnc.frames.CN(rh);
RNl = gnc.frames.CN(rl);

% Angular velocity w(t) C/N
% Calculate -wxmat from numerical differences
wxmat = -RNl'*(RNh-RNl); % d/dt

w(1) = wxmat(3,2);
w(2) = wxmat(1,3);
w(3) = wxmat(2,1);
w = w';
end

