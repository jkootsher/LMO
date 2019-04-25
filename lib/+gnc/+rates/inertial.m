function dr = inertial(satellite)
% Calculate inertial rates from the
% satellite Euler angle orientation (3-1-3)
n = satellite.n;
HN = gnc.frames.HN(satellite.o.at(n));
satellite.dr.ts.data(:,n) = HN'*cross(satellite.do.at(n),satellite.r.ic.data);   

% Update the frame information
satellite.dr.ts.frame = "Inertial";
end

