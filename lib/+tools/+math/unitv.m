function x = unitv(x)
% Make the vector x a unit vector
x = x/tools.math.divzero(norm(x));
end

