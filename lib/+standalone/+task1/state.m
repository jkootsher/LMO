function [r,dr] = state(R,O)
% Calculate inertial state vectors from the
% given radius and Euler angles (3-1-3)

% Attitude rate description

B = tools.math.bmat(O);
w = B*tools.get.ic.eulerrate(R);

% Get the frame from 3-1-3
ON(1,1) = cos(O(3))*cos(O(1)) - sin(O(3))*cos(O(2))*sin(O(1));
ON(1,2) = cos(O(3))*sin(O(1)) + sin(O(3))*cos(O(2))*cos(O(1));
ON(1,3) = sin(O(3))*sin(O(2));
ON(2,1) = -sin(O(3))*cos(O(1)) - cos(O(3))*cos(O(2))*sin(O(1));
ON(2,2) = -sin(O(3))*sin(O(1)) + cos(O(3))*cos(O(2))*cos(O(1));
ON(2,3) = cos(O(3))*sin(O(2));
ON(3,1) = sin(O(2))*sin(O(1));
ON(3,2) = -sin(O(2))*cos(O(1));
ON(3,3) = cos(O(2));

% Inertial position from orbit frame
r = ON'*R;

% Inertial velocity from orbit frame
dr = ON'*cross(w,R);   
end


