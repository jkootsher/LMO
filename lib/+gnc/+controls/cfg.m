function Xb = cfg(satellite,X)
% Configure simulation wide timing and the controller
n = satellite.n;
constants = tools.get.constant.value;

% Configure simulation timing (if necessary)
if ~isequal(satellite.C,@tools.get.stub)
    constants.N = n;
end
    
% Configure the satellite state information
satellite.s.ts.data(:,n) = X(1:3,n);
satellite.w.ts.data(:,n) = X(4:6,n);

% Obtain frame information
[~,sb,wb] = satellite.C(n);

% Construct the state estimate
Xb = [sb;wb];
end

