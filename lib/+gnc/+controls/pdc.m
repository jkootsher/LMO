function u = pdc(Xb)
% Proportional derivative controller
I = tools.get.ic.inertia;
T = tools.get.constant.value.T;

% Calculate all gains and take the infinity norm
P = norm(I/T,inf);
K = 2*norm(I/T^2,inf);

% Setup controller
u = -I\(K*Xb(1:3) + P*Xb(4:6));
end

