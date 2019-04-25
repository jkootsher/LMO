function R = SN(x)
% Inertial to sun pointing frame conversion

% Get the body to inertial frame
NB = gnc.frames.BN(x)';

% Using kmat.m as a guideline for construction
% of a DCM with general basis vectors (dot products),
% simple row permutation and constants can be used to
% define the BR frame from the BN frame.

% [r1,r2,r3]=[-n1,n3,n2]
RB(1,:) = -NB(1,:);
RB(2,:) = NB(3,:);
RB(3,:) = NB(2,:);

% RN = RBBN
R = RB*NB';
end

