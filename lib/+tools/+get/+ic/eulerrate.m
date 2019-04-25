function do = eulerrate(r)
    % Calculate the 3-1-3 rate (rad/s) for a circular orbit
    do = [0;0;sqrt(tools.get.constant.value.u/r(1)^3)];
end

