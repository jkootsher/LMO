function K = kmat(f,g)
% Calculate the K (C) matrix
% using individual vectors
K(1,1) = f(1)*g(1);
K(1,2) = f(1)*g(2);
K(1,3) = f(1)*g(3);
K(2,1) = f(2)*g(1);
K(2,2) = f(2)*g(2);
K(2,3) = f(2)*g(3);
K(3,1) = f(3)*g(1);
K(3,2) = f(3)*g(2);
K(3,3) = f(3)*g(3);
end

