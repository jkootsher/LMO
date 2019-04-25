function RN = frame(t)
% Inertial to sun pointing frame conversion

HN = standalone.task2.frame(t);
NH = HN';

% Using kmat.m as a guideline for construction
% of a DCM with general basis vectors (dot products),
% simple row permutation and constants can be used to
% define the BR frame from the BN frame.

% [r1,r2,r3]=[-n1,n3,n2]
RH(1,:) = -NH(1,:);
RH(2,:) = NH(3,:);
RH(3,:) = NH(2,:);

% RN = RHHN
RN = RH*HN;
end

