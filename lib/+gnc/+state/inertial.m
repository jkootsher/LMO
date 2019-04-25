function inertial(satellite)
% Calculate inertial state vectors from the
% given radius and Euler angles (3-1-3)
n = satellite.n;

% Inertial position from orbit frame
HN = gnc.frames.HN(satellite.o.at(n));
satellite.r.ts.data(:,n) = HN'*satellite.r.ic.data;

% Update the frame information
satellite.r.ts.frame = "Inertial";
end

