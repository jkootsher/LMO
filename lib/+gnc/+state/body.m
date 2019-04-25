function body(satellite)
% Body frame state vector [s;w]
n = satellite.n;
X = satellite.X;

% RK4 f(X,u) and time normalization
dX = @tools.math.integrands.dX;
h = tools.get.constant.value.h;

% RK4 integrator
integrate = @tools.math.integrate;

% Initial state vector
if isequal(n,1)
    X = [satellite.s.ic.data;satellite.w.ic.data];
end

% Prepare state estimate
Xb = gnc.controls.cfg(satellite,X);

% Obtain control torque every second
if isequal(h,1) || isequal(mod(n,1/h),1)
    satellite.u = satellite.U(Xb);
end

% State update
X(:,n+1) = X(:,n) + integrate(dX,X(:,n),satellite.u);

% Check MRP for shadow set (shortest path)
if sqrt(X(1:3,n+1)'*X(1:3,n+1)) > 1
    X(1:3,n+1) = -X(1:3,n+1)/(X(1:3,n+1)'*X(1:3,n+1));
end

% Update object
satellite.X = X;

% Refresh data set using completed X state vector.
% First step 0->1 (1->2 Matlab) is IC and omitted.
if isequal(n,tools.get.constant.value.dn)
    satellite.s.ts.data = X(1:3,2:end);
    satellite.w.ts.data = X(4:6,2:end);
end

% Update the frame information
satellite.s.ts.frame = "Body";
satellite.w.ts.frame = "Body";
end
