function T = Tenergy(w)
% Calculate the rotational kinetic energy
T = .5*w'*tools.get.ic.inertia*w;
end

