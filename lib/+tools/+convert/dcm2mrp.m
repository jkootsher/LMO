function s = dcm2mrp(C)
% Convert a DCM to its MRP equivalent
c = sqrt(trace(C)+1);
c = 1/tools.math.divzero((c*(c+2)));

% MRPs
s(1) = c*(C(2,3)-C(3,2));
s(2) = c*(C(3,1)-C(1,3));
s(3) = c*(C(1,2)-C(2,1));
s = s';
end

