function [RN,sbar,wbar] = N2C(obj,n)
% Obtain the communications pointing frame orientation for this craft
GMO = spacecraft.GMO.satellite;

% Adjust for orbit frame IC (if needed)
if isequal(n,0)
    NH = gnc.frames.HN(GMO.o.at(0))';
    GMOr = NH*GMO.r.at(0);
    
    NH = gnc.frames.HN(obj.o.at(0))';
    LMOr = NH*obj.r.at(0);
else % Already in inertial frame
    GMOr = GMO.r.at(n);
    LMOr = obj.r.at(n);
end

r = GMOr - LMOr;
RN = gnc.frames.CN(r);

% Create a new frame
R = tools.get.frame(RN,n);
R.w.frame = "Inertial";

% Generate frame information
R.w.data = gnc.rates.comm(obj);
[sbar,wbar] = gnc.controls.afc(obj,R);
end