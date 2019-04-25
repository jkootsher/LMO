function W = w(t)
% Communications pointing angular velocity

% Necessary frames
RNh = standalone.task5.frame(t+1);
RNl = standalone.task5.frame(t);

% Angular velocity w(t) C/N
% Calculate -wxmat from numerical differences
wxmat = -RNl'*(RNh-RNl); % d/dt
W(1) = wxmat(3,2);
W(2) = wxmat(1,3);
W(3) = wxmat(2,1);
end

