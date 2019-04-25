function [R,O] = setup(satellite,dt)
% Setup the satellite from its initial conditions

if isequal(satellite,"GMO")
    % Euler angles (3-1-3) GMO
    O = tools.convert.deg2rad([0;0;250]);
    R = [20424.2;0;0];    
elseif isequal(satellite,"LMO")
    % Euler angles (3-1-3) LMO
    O = tools.convert.deg2rad([20;30;60]);
    R = tools.get.ic.altitude([400;0;0]);
else
    fprintf("FAILED TO INITIALIIZE! Use 'GMO' or 'LMO' as input to setup.m.");
    return
end

if dt > 0
    dO = tools.get.ic.eulerrate(R);

    % Use slope approximation from ICs
    for i = 1:dt    
       o(:,i) = tools.math.eulersum(dO,O,i);
    end

    % 3-1-3 at step dt
    O = o(:,dt);
end
end

