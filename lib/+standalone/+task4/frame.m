function RN = frame(t)
% Inertial to sun pointing frame conversion

HN = standalone.task2.frame(t);

% Using kmat.m as a guideline for construction
% of a DCM with general basis vectors (dot products),
% simple row permutation and constants can be used to
% define the BR frame from the BN frame.

% [r1,r2,r3]=[-h1,h2,r1xr2]
RN(1,:) = -HN(1,:);
RN(2,:) = HN(2,:);
RN(3,:) = cross(RN(1,:),RN(2,:));
end

