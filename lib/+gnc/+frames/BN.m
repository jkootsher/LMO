function C = BN(x)
% Inertial to body frame conversion
xn = norm(x)^2;
xt = tools.math.xmat(x);
C = eye(3) + (8*xt^2 - 4*(1-xn)*xt)/(1+xn)^2;
end

