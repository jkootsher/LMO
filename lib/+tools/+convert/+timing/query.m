function query(t)
% Set the query for the given time in terms of samples
constants = tools.get.constant.value;
constants.N = t/constants.h;
end

