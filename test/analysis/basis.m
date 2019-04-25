function p = basis(s)
% Evaluate the MRP set as a basis vector using the principal axis
for i = 1:length(s)
    paxis(1,i) = 4*atan(s(1,i));
    paxis(2,i) = 4*atan(s(2,i));
    paxis(3,i) = 4*atan(s(3,i));
end

xplot(paxis');
p = paxis;
end

