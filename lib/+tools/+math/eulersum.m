function k = eulersum(df,f,n)
% Integrate the vector g at sample n using the appropriate
% integrand function f
h = tools.get.constant.value.h;

% Using a simple 1st order Euler integrator
k = f + n*h*df;
end

