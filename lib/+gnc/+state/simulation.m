function simulation(GMO,LMO)
% Determines which controller to use based on the LMO orientation.
n = LMO.n;          % Sample is identical for GMO and LMO
GMOr = GMO.r.at(n); % Inertial position of GMO at sample n
LMOr = LMO.r.at(n); % Inertial position of LMO at sample n

% Find the angle between the two inertial vectors
a = acos(dot(GMOr,LMOr)/tools.math.divzero(norm(GMOr)*norm(LMOr)));

% Check if the LMO is in the shadow of Mars
if LMOr(2) < 0 % Eclipse of Mars (-n(2))
    % Check if the GMO is in a 35deg arc of LMO
    if a < tools.convert.deg2rad(35)
        LMO.C = @LMO.N2C;
    else    % Data collection mode
        LMO.C = @LMO.N2P;
    end
else        % Charge solar panels
    LMO.C = @LMO.N2S;
end    
end

