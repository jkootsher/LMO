function k = dX(X,u)
% Integration for state vector
I = tools.get.ic.inertia;

% Break out state data
s = X(1:3); w = X(4:6);

% Tilda matrix (cross product)
sx = tools.math.xmat(s);
wx = tools.math.xmat(w);

% Calculate next state
s = .25*((1-s'*s)*eye(3) + 2*sx + 2*(s*s'))*w;
w = -inv(I)*wx*I*w + u;

k = [s;w];
end

