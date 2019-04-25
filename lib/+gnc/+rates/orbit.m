function orbit(satellite)
% Calculate the inertial rates from the orbital rates
n = satellite.n;
B = tools.math.bmat(satellite.o.at(n));
satellite.do.ts.data(:,n) = B*satellite.do.ic.data;

% Update frame
satellite.do.ts.frame = "Orbit";
end

