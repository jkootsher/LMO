function HN = N2H(obj,n)
% Obtain the orbit frame orientation for this craft
HN = gnc.frames.HN(obj.o.at(n));
end

