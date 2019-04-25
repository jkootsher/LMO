function W = w(t)
% Sun pointing angular velocity

[R,~] = support.setup("LMO",t);
dO = tools.get.ic.eulerrate(R);

% Necessary frames
HN = standalone.task2.frame(t);
RN = standalone.task3.frame(t);

% Angular velocity w(t) S/N
w = cross(R,R.*dO);
W = RN'*RN*HN'*w;
end

