function orbit(satellite)
% Calculate attitude from the given
% Euler angles (3-1-3)
O = satellite.o.ic.data;
dO = satellite.do.ic.data;

% Euler 1st order integrator
integrate = @tools.math.eulersum;

% Use slope approximation from ICs
n = satellite.n;
satellite.o.ts.data(:,n) = integrate(dO,O,n);
end

