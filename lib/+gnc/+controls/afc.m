function [s,w] = afc(satellite,frame)
% Attitude feedback controller for tracking error
% in orientation (MRP) and angular velocity
BN = gnc.frames.BN(satellite.s.at(frame.n));

% Relative attitude / angular velocity
RB = frame.RN*BN';
s = tools.convert.dcm2mrp(RB');
w = BN*(BN'*satellite.w.at(frame.n) - frame.w.data);
end

