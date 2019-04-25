function r = altitude(h)
    % Calculate the altitude from center of Mars
    r = [tools.get.constant.value.R;0;0] + h;
end

