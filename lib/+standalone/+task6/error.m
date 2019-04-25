function [sb,wb] = error(RN,w)
% Sun, Nadir, GMO frame tracking error
BN = gnc.frames.BN([0.3;-0.4;0.5]);
W = tools.convert.deg2rad([1.00;1.75;-2.20]);

% Relative attitude / angular velocity
RB = RN*BN';
sb = tools.convert.dcm2mrp(RB')';
wb = BN*(BN'*W - w);
end

