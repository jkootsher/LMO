function w = nadir(satellite)
% Nadir pointing frame rates calculation
% Rotate frames to find appropriate rates
N = tools.get.constant.value.N;

% Attitude at t=n
o = satellite.o.at(N);

% Necessary frames
RN = gnc.frames.PN(o);
RH = gnc.frames.HR(o)';

% Angular velocity w(t) P/N
% w is initially in the orbit frame
w = RN'*RH*satellite.do.at(N);
end

