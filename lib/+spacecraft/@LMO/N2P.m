function [RN,sbar,wbar] = N2P(obj,n)
% Obtain the nadir pointing frame orientation for this craft
RN = gnc.frames.PN(obj.o.at(n));

% Create a new frame
R = tools.get.frame(RN,n);
R.w.frame = "Inertial";

% Generate frame information
R.w.data = gnc.rates.nadir(obj);
[sbar,wbar] = gnc.controls.afc(obj,R);
end
