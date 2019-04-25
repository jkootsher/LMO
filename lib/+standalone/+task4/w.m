function W = w(t)
% Sun pointing angular velocity

[R,O] = support.setup("LMO",t);
dO = tools.get.ic.eulerrate(R);

% Necessary frames
HN = standalone.task2.frame(t);
RN = standalone.task4.frame(t);

% Angular velocity w(t) P/N
% w_N = NR*RN*NH*w_H
w = tools.math.bmat(O)*dO;
W = RN'*RN*HN'*w;
end

