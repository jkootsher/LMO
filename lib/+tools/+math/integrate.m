function k = integrate(f,g,u)
% Integrate the vector g at time i using the appropriate
% integrand function f

% Using a modified Runge-Kutta Method (RK4) where only discrete times
%  are input and a normalization factor is used to correct the offset.
h = tools.get.constant.value.h;

k1 = h*f(g,u);
k2 = h*f(g+k1/2,u);
k3 = h*f(g+k2/2,u);
k4 = h*f(g+k3,u);

k = (1/6)*(k1+2*k2+2*k3+k4);
end

