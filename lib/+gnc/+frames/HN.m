function H = HN(x)
% Inertial to orbit (Hill) frame conversion
% Euler 3-1-3 matrix    
H(1,1) = cos(x(3))*cos(x(1)) - sin(x(3))*cos(x(2))*sin(x(1));
H(1,2) = cos(x(3))*sin(x(1)) + sin(x(3))*cos(x(2))*cos(x(1));
H(1,3) = sin(x(3))*sin(x(2));
H(2,1) = -sin(x(3))*cos(x(1)) - cos(x(3))*cos(x(2))*sin(x(1));
H(2,2) = -sin(x(3))*sin(x(1)) + cos(x(3))*cos(x(2))*cos(x(1));
H(2,3) = cos(x(3))*sin(x(2));
H(3,1) = sin(x(2))*sin(x(1));
H(3,2) = -sin(x(2))*cos(x(1));
H(3,3) = cos(x(2));
end

