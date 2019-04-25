function RN = frame(t)
% Inertial to communications pointing frame conversion

[R,O] = support.setup("LMO",t);
[LMOr,~] = standalone.task1.state(R,O);

[R,O] = support.setup("GMO",t);
[GMOr,~] = standalone.task1.state(R,O);

r = GMOr - LMOr;

% Using kmat.m as a guideline for construction
% of a DCM with general basis vectors (dot products)
RN(1,:) = -r;
RN(1,:) = RN(1,:)/tools.math.divzero(norm(RN(1,:)));

% Obtain basis vector r2 as r1xn3
n3 = [0;0;1];
r2 = cross(r,n3);

RN(2,:) = r2/tools.math.divzero(norm(r2));
RN(3,:) = cross(RN(1,:),RN(2,:));
end

