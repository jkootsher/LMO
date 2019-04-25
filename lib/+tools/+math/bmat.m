function B = bmat(x)
% 3-1-3 rates to angular velocity
B(1,1) = sin(x(3))*sin(x(2));
B(1,2) = cos(x(3));
B(1,3) = 0;
B(2,1) = cos(x(3))*sin(x(2));
B(2,2) = -sin(x(3));
B(2,3) = 0;
B(3,1) = cos(x(2));
B(3,2) = 0;
B(3,3) = 1;
end

