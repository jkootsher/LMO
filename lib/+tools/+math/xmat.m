function X = xmat(x)
% Creates the cross product matrix
X(1,:) = [0;-x(3);x(2)];
X(2,:) = [x(3);0;-x(1)];
X(3,:) = [-x(2);x(1);0];
end

