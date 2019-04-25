function [RN,sbar,wbar] = N2S(obj,n)
% Obtain the sun pointing frame orientation for this craft
RN = gnc.frames.SN(obj.s.at(n));

% Create a new frame
R = tools.get.frame(RN,n);
R.w.frame = "Inertial";

% Generate frame information
R.w.data = gnc.rates.sun(obj);
[sbar,wbar] = gnc.controls.afc(obj,R);
end

