function [H,T,s] = integrator
% Integrator will verify RK4 at 1Hz
const = tools.get.constant.value;
const.h = 1;

% Initialize
u = gnc.controls.cct;
w = tools.convert.deg2rad([1.00;1.75;-2.20]);

% Setup RK4
X = [0.3;-0.4;0.5;w];
dX = @tools.math.integrands.dX;
integrate = @tools.math.integrate;

if isequal(norm(u),0) % u = [0;0;0] Nm
    t = 500;
    for n = 1:t+1 % Matlab offset
        X(:,n+1) = X(:,n) + integrate(dX,X(:,n),u);
        
        % Check MRP for shadow set (shortest path)
        if sqrt(X(1:3,n+1)'*X(1:3,n+1)) > 1
            X(1:3,n+1) = -X(1:3,n+1)/(X(1:3,n+1)'*X(1:3,n+1));
        end
    end
    
    % Angular momentum (inertial,body)
    BN = gnc.frames.BN(X(1:3,n));
    H(:,1) = BN'*tools.physics.Hmomentum(X(4:6,n));
    H(:,2) = tools.physics.Hmomentum(X(4:6,n));
    
    % Kinetic energy (rotational); only vector for test purposes
    T = [tools.physics.Tenergy(X(4:6,n));0;0];
    
    % Attitude
    s = X(1:3,n);
    
else % u = [.01;-.01;.02] Nm
    t = 100;
    for n = 1:t+1 % Matlab offset
        X(:,n+1) = X(:,n) + integrate(dX,X(:,n),u);
        
        % Check MRP for shadow set (shortest path)
        if sqrt(X(1:3,n+1)'*X(1:3,n+1)) > 1
            X(1:3,n+1) = -X(1:3,n+1)/(X(1:3,n+1)'*X(1:3,n+1));
        end
    end
    H = 0; T = 0;
    
    % Attitude
    s = X(1:3,n);
end

