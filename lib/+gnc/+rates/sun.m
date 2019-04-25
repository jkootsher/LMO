function w = sun(satellite)
% Sun pointing frame rates calculation
% Rotate frames to find appropriate rates
N = tools.get.constant.value.N;

% State vector is inertial IC
r = satellite.r.ic.data;
dr = satellite.dr.ic.data;

% Necessary frames
RN = gnc.frames.SN(satellite.s.at(N));

% Angular velocity w(t) S/N
% w is initially in the inertial frame

% Under the hood this is w_N = NH*w_O
w = tools.math.unitv(cross(r,dr));
w = RN'*RN*w;
end

