function R = PN(x)
% Inertial to nadir pointing frame conversion

% Get the inertial to body frame
HN = gnc.frames.HN(x);

% Using kmat.m as a guideline for construction
% of a DCM with general basis vectors (dot products),
% simple row permutation and constants can be used to
% define the HP frame from the HN frame.

% [r1,r2,r3]=[-h1,h2,r1xr2]
RN(1,:) = -HN(1,:);
RN(2,:) = HN(2,:);
RN(3,:) = cross(RN(1,:),RN(2,:));

% RN = RN
R = RN;
end