function R = CN(x)
% Inertial to communications pointing frame conversion

% Using kmat.m as a guideline for construction
% of a DCM with general basis vectors (dot products)
R(1,:) = tools.math.unitv(-x);

% Obtain basis vector R2 as r1xn3
n3 = [0;0;1];

R(2,:) = tools.math.unitv(cross(x,n3));
R(3,:) = cross(R(1,:),R(2,:));
end

