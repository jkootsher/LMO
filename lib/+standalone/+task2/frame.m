function HN = frame(t)
% Inertial to orbit (Hill) frame conversion
% Euler 3-1-3 C matrix

[~,O] = support.setup("LMO",t);

HN(1,1) = cos(O(3))*cos(O(1)) - sin(O(3))*cos(O(2))*sin(O(1));
HN(1,2) = cos(O(3))*sin(O(1)) + sin(O(3))*cos(O(2))*cos(O(1));
HN(1,3) = sin(O(3))*sin(O(2));
HN(2,1) = -sin(O(3))*cos(O(1)) - cos(O(3))*cos(O(2))*sin(O(1));
HN(2,2) = -sin(O(3))*sin(O(1)) + cos(O(3))*cos(O(2))*cos(O(1));
HN(2,3) = cos(O(3))*sin(O(2));
HN(3,1) = sin(O(2))*sin(O(1));
HN(3,2) = -sin(O(2))*cos(O(1));
HN(3,3) = cos(O(2));

end

